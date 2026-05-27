import 'package:flutter/material.dart';

import 'package:skillroot/routes.dart';

import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/text_fields.dart';
import 'package:skillroot/widgets/auth_elements.dart';

import 'package:skillroot/pages/auth/register.dart';
import 'package:skillroot/pages/auth/reset.dart';

import 'package:skillroot/services/api.dart';
import 'package:skillroot/services/alert.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isMicrosoftLoading = false;

  Widget _buildMicrosoftLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 8, height: 8, color: const Color(0xfff25022)),
            const SizedBox(width: 2),
            Container(width: 8, height: 8, color: const Color(0xff7fba00)),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 8, height: 8, color: const Color(0xff00a4ef)),
            const SizedBox(width: 2),
            Container(width: 8, height: 8, color: const Color(0xffffb900)),
          ],
        ),
      ],
    );
  }

  Future<void> _handleMicrosoftLogin(ThemeData theme) async {
    if (isLoading || isMicrosoftLoading) return;

    setState(() {
      isMicrosoftLoading = true;
    });

    AuthenticateResult authResult;
    try {
      authResult = await Api.authenticateWithMicrosoft();
    } catch (e) {
      authResult = AuthenticateResult.fromMap({
        'success': false,
        'message': 'Microsoft SSO failed. Please try again.',
      });
    } finally {
      if (mounted) {
        setState(() {
          isMicrosoftLoading = false;
        });
      }
    }

    if (authResult.success) {
      Navigator.pushNamed(context, Routes.HOME);
    } else if (authResult.requireTwoFactor) {
      Navigator.pushNamed(context, Routes.TWOFACTOR);
    } else {
      Alert.error(authResult.message);
    }
  }

  Widget _buildMicrosoftButton(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffcbd5e1), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (isLoading || isMicrosoftLoading)
              ? null
              : () => _handleMicrosoftLogin(theme),
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 52,
            width: double.infinity,
            alignment: Alignment.center,
            child: isMicrosoftLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMicrosoftLogo(),
                      const SizedBox(width: 12),
                      Text(
                        "Sign in with Microsoft",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff1f2a3d),
                          letterSpacing: -0.1,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.scaffoldBackgroundColor,
        child: Stack(
          children: [
            AuthElements.headerBackdrop(size),
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthElements.brandHeader(theme),
                    SizedBox(height: 12),
                    Text(
                      "Grow your skills. Root for your next move.",
                      style: theme.textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(31),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withAlpha(46)),
                      ),
                      child: Text(
                        "Login to $appName to keep your learning and job history in sync.",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white.withAlpha(236),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(13),
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back",
                            style: theme.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Color(0xff1f2a3d),
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Sign in to continue your journey.",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Color(0xff5c667a),
                            ),
                          ),
                          const SizedBox(height: 22),
                          UnderlinedTextField(
                            hintText: "Email",
                            controller: usernameController,
                            isRequired: true,
                          ),
                          const SizedBox(height: 18),
                          UnderlinedTextField(
                            hintText: "Password",
                            suffixIcon: Image.asset(
                              ThemeStrings.v58,
                              height: 25,
                            ),
                            isPasswordField: true,
                            controller: passwordController,
                            isRequired: true,
                          ),
                          const SizedBox(height: 24),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withAlpha(90),
                                  blurRadius: 22,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: RoundedFlatButton(
                              name: "LOGIN",
                              isLoading: isLoading,
                              click: () async {
                                AuthenticateResult authResult;
                                String? validation = validateInput();
                                if (validation != null) {
                                  Alert.error(validation);
                                  return;
                                }

                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  authResult = await Api.authenticate(
                                    usernameController.text,
                                    passwordController.text,
                                  );
                                } catch (e) {
                                  authResult = AuthenticateResult.fromMap({
                                    'success': false,
                                    'message':
                                        'Connection error. Please check your internet.',
                                  });
                                } finally {
                                  if (mounted) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }

                                if (authResult.success) {
                                  Navigator.pushNamed(context, Routes.HOME);
                                } else if (authResult.requireTwoFactor) {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.TWOFACTOR,
                                  );
                                } else {
                                  Alert.error(authResult.message);
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: const Color(0xffcbd5e1),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "or connect with",
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: const Color(0xff5c667a),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: const Color(0xffcbd5e1),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildMicrosoftButton(theme),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New to $appName?",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f2a3d),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => RegisterScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Create account",
                                  style: theme.textTheme.displayLarge!.copyWith(
                                    fontSize: 14,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Forgot your password?",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f2a3d),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ResetScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Reset Password",
                                  style: theme.textTheme.displayLarge!.copyWith(
                                    fontSize: 14,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16 + MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateInput() {
    if (usernameController.text == "") {
      return "Username is required.";
    }
    if (passwordController.text == "") {
      return "Password is required.";
    }
    return null;
  }
}
