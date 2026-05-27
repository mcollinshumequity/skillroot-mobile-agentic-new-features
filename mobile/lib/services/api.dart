import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../config.dart';

class Api {
  static String? _sessionCookie;

  static bool hasRemoteHost = false;

  static final String apiLocation = apiHost;
  static final String authLocation = apiHost;

  static Future<Map<String, dynamic>> call(
    String endpoint, {
    Map? parameters,
    bool? delete,
    bool authenticating = false,
    String? fileName,
  }) async {
    var url = Uri.parse((authenticating ? authLocation : apiLocation) + endpoint);
    const JsonEncoder encoder = JsonEncoder();
    const JsonDecoder decoder = JsonDecoder();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-sr-api-key': apiKey,
    };

    // Always try to include the Authorization header if we have a Firebase user or a session
    if (FirebaseAuth.instance.currentUser != null) {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      if (token != null) {
        requestHeaders['Authorization'] = 'Bearer $token';
      }
    } else if (_sessionCookie != null) {
      requestHeaders['Authorization'] = 'Bearer $_sessionCookie';
    }

    http.BaseResponse response;
    try {
      if (fileName != null) {
        var request = http.MultipartRequest("POST", url)
          ..headers.addAll(requestHeaders)
          ..files.add(
            await http.MultipartFile.fromPath(
              'file',
              fileName,
              contentType: MediaType('image', 'jpeg'),
            ),
          );
        response = await request.send().timeout(const Duration(seconds: 10));
      } else if (delete ?? false) {
        response = await http.post(url, headers: requestHeaders).timeout(const Duration(seconds: 10));
      } else if (parameters == null) {
        response = await http.get(url, headers: requestHeaders).timeout(const Duration(seconds: 10));
      } else {
        response = await http.post(url, body: encoder.convert(parameters), headers: requestHeaders).timeout(const Duration(seconds: 10));
      }
    } catch (e) {
      print("DEBUG: Network Error: $e");
      return {'success': false, 'message': 'Network error. Ensure the server is running.'};
    }

    print("DEBUG: API Request to ${url.toString()}");
    print("DEBUG: HTTP Status: ${response.statusCode}");

    if (response.statusCode == 401) {
      // Token likely expired, Firebase usually refreshes this automatically in the header logic
      // but we return the failure let the UI handle a hard logout if necessary.
      return {'success': false, 'message': 'Session expired. Please login again.'};
    }

    parseHeaders(response.headers);

    try {
      String responseText = "";
      if (response is http.Response) {
        responseText = response.body;
      } else if (response is http.StreamedResponse) {
        responseText = await response.stream.bytesToString();
      } else {
        throw const FormatException();
      }
      print("DEBUG: Raw Response: $responseText");
      return decoder.convert(responseText);
    } on FormatException {
      return {'success': false, 'message': 'Communication Error: Invalid response format'};
    } on TypeError catch (e) {
      print("DEBUG: Type Error in API Call: $e");
      return {'success': false, 'message': 'Communication Error: Unexpected data type'};
    } catch (e) {
      print("DEBUG: General Error in API Call: $e");
      return {'success': false, 'message': 'Connection failed. Please ensure the server is running.'};
    }
  }

  static Future<AuthenticateResult> authenticate(String username, String password) async {
    try {
      print("DEBUG: Starting Firebase Authentication for $username");
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      print("DEBUG: Firebase Auth Success");

      // 2. Retrieve the ID Token
      String? idToken = await userCredential.user?.getIdToken();
      print("DEBUG: Firebase ID Token retrieved: ${idToken != null}");

      if (idToken == null) {
        return AuthenticateResult.fromMap({'success': false, 'message': 'Failed to retrieve Firebase Token.'});
      }

      print("DEBUG: Calling API Portal validate-token");
      AuthenticateResult result = AuthenticateResult.fromMap(
        await call(
          "validate-token",
          authenticating: true,
        ),
      );
      print("DEBUG: API Portal response success: ${result.success}");

      if (result.success) {
        _sessionCookie = idToken; // Use the portal session or ID token as our current Bearer
      }

      return result;
    } on FirebaseAuthException catch (e) {
      return AuthenticateResult.fromMap({'success': false, 'message': e.message ?? 'Authentication failed.'});
    } catch (e) {
      return AuthenticateResult.fromMap({'success': false, 'message': 'Unexpected error during login.'});
    }
  }

  static Future<AuthenticateResult> authenticateWithMicrosoft() async {
    try {
      print("DEBUG: Starting Firebase Microsoft Authentication");
      final provider = OAuthProvider("microsoft.com");
      
      UserCredential userCredential = await FirebaseAuth.instance.signInWithProvider(provider);
      print("DEBUG: Firebase Microsoft Auth Success");

      // 2. Retrieve the ID Token
      String? idToken = await userCredential.user?.getIdToken();
      print("DEBUG: Firebase ID Token retrieved: ${idToken != null}");

      if (idToken == null) {
        return AuthenticateResult.fromMap({'success': false, 'message': 'Failed to retrieve Firebase Token.'});
      }

      print("DEBUG: Calling API Portal validate-token");
      AuthenticateResult result = AuthenticateResult.fromMap(
        await call(
          "validate-token",
          parameters: {},
          authenticating: true,
        ),
      );
      print("DEBUG: API Portal response success: ${result.success}");

      if (result.success) {
        _sessionCookie = idToken; // Use the portal session or ID token as our current Bearer
      }

      return result;
    } on FirebaseAuthException catch (e) {
      return AuthenticateResult.fromMap({'success': false, 'message': e.message ?? 'Microsoft authentication failed.'});
    } catch (e) {
      return AuthenticateResult.fromMap({'success': false, 'message': 'Unexpected error during Microsoft login.'});
    }
  }

  static Future<RegisterResult> register({
    required String password,
    required String passwordConfirmation,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    try {
      // 1. Create User in Firebase Auth
      print("DEBUG: Creating Firebase User for $email");
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("DEBUG: Firebase User created successfully");

      // 2. Notify our Portal to create the DB record
      // The Authorization header will be automatically included by Api.call
      print("DEBUG: Calling API Portal register/user");
      Map<String, dynamic> response = await call(
        "register/user",
        parameters: {
          "first_name": firstName,
          "last_name": lastName,
          "phone_number": phone,
          "email": email,
          "uid": userCredential.user!.uid,
        },
        authenticating: true,
      );

      RegisterResult result = RegisterResult.fromMap(response);

      // 3. If Portal fails, we might want to delete the Firebase user to keep in sync,
      // but for now we'll just return the result.
      if (!result.success) {
        print("DEBUG: Portal registration failed: ${result.message}");
      }

      return result;
    } on FirebaseAuthException catch (e) {
      print("DEBUG: Firebase Registration Error: ${e.code} - ${e.message}");
      return RegisterResult.fromMap({"success": false, "message": e.message ?? "Firebase registration failed."});
    } catch (e) {
      print("DEBUG: Unexpected Registration Error: $e");
      return RegisterResult.fromMap({"success": false, "message": "An unexpected error occurred."});
    }
  }

  static Future<AuthenticateResult> requestReset(Map<String, String> parameters) async {
    return AuthenticateResult.fromMap(
      await call(
        "reset.action",
        parameters: parameters,
        authenticating: true,
      ),
    );
  }

  static void parseHeaders(Map<String, String> headers) {
    for (MapEntry entry in headers.entries) {
      // Updated to look for common token headers or continue supporting cookies if needed
      if (entry.key.toLowerCase() == 'authorization' || entry.key.toLowerCase() == 'x-auth-token') {
        _sessionCookie = entry.value.replaceFirst('Bearer ', '');
      } else if (entry.key.toLowerCase() == 'set-cookie') {
        var parts = entry.value.split("; ");
        for (var part in parts) {
          if (part.startsWith("ci_session=")) {
            _sessionCookie = part.substring(11);
            break;
          }
        }
      }
    }
  }

  static void signOut() {
    _sessionCookie = null;
  }
}

class ApiResult {
  bool success;
  String message;
  ApiResult({required this.success, required this.message});
  ApiResult.fromMap(Map<String, dynamic> map)
      : success = (map["success"] == true) || (map["status"] == 200 || map["status"] == "200" || map["status"] == "success"),
        message = map["message"] ?? "Unknown";
}

class AuthenticateResult extends ApiResult {
  late bool requireTwoFactor;
  String? twoFactorPrompt;
  AuthenticateResult.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    twoFactorPrompt = map["2faPrompt"] ?? null;
    requireTwoFactor = twoFactorPrompt != null;
  }
}

class RegisterResult extends ApiResult {
  RegisterResult.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
