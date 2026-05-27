import 'package:flutter/material.dart';
import 'dart:async';

import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/text_fields.dart';
import 'package:skillroot/widgets/auth_elements.dart';
import 'package:skillroot/config.dart';

import 'package:skillroot/services/api.dart';
import 'package:skillroot/services/alert.dart';
import 'package:skillroot/services/theme.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfController = TextEditingController();

  bool isGoodState = false;
  bool isLoading = false;

  ResetPhase resetPhase = ResetPhase.initiate;

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
                      style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(31),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withAlpha(46)),
                      ),
                      child: Text(
                        "Login to $appName to keep your learning and job history in sync.",
                        style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white.withAlpha(235)),
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
                          BoxShadow(color: Colors.black.withAlpha(13), blurRadius: 24, offset: const Offset(0, 12)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reset password",
                            style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, color: Color(0xff1f2a3d), letterSpacing: -0.2),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            switch (resetPhase) {
                              ResetPhase.initiate => "Reset your password to continue your journey.",
                              ResetPhase.authenticate => "We sent you a verification code via your preferred communication method. Please enter that code below.",
                              ResetPhase.execute => "Enter and confirm a new password for your account.",
                            },
                            style: theme.textTheme.bodyMedium!.copyWith(color: Color(0xff5c667a)),
                          ),
                          const SizedBox(height: 22),
                          if (resetPhase == ResetPhase.initiate) ...[
                            UnderlinedTextField(
                              key: ObjectKey("email"),
                              hintText: "Email",
                              controller: emailController,
                              isRequired: true,
                              keyboardtype: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 18),
                          ] else if (resetPhase == ResetPhase.authenticate) ...[
                            UnderlinedTextField(
                              key: ObjectKey("token"),
                              hintText: "Verification Code",
                              controller: tokenController,
                              isRequired: true,
                            ),
                            const SizedBox(height: 24),
                          ] else ...[
                            UnderlinedTextField(
                              key: ObjectKey("password"),
                              hintText: "Password",
                              suffixIcon: Image.asset(ThemeStrings.v58, height: 25),
                              isPasswordField: true,
                              controller: passwordController,
                              isRequired: true,
                            ),
                            const SizedBox(height: 24),
                            UnderlinedTextField(
                              hintText: "Confirm Password",
                              suffixIcon: Image.asset(ThemeStrings.v58, height: 25),
                              isPasswordField: true,
                              controller: passConfController,
                              isRequired: true,
                            ),
                            const SizedBox(height: 24),
                          ],
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: primaryColor.withAlpha(90), blurRadius: 22, offset: const Offset(0, 10))],
                            ),
                            child: RoundedFlatButton(
                              name: switch (resetPhase) {
                                ResetPhase.initiate => "REQUEST RESET",
                                ResetPhase.authenticate => "SUBMIT CODE",
                                ResetPhase.execute => "SET PASSWORD",
                              },
                              isGoodState: isGoodState,
                              isLoading: isLoading,
                              click: () async {
                                String? validationError = validateInput();
                                if (validationError != null) {
                                  Alert.error(validationError);
                                  return;
                                }

                                AuthenticateResult authResult;
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  if (resetPhase == ResetPhase.initiate) {
                                    authResult = await Api.requestReset({"Email": emailController.text});
                                  } else if (resetPhase == ResetPhase.authenticate) {
                                    authResult = await Api.requestReset({"Email": emailController.text, "Token": tokenController.text});
                                  } else {
                                    // if (resetPhase == ResetPhase.execute) {
                                    authResult = await Api.requestReset({
                                      "Email": emailController.text,
                                      "Token": tokenController.text,
                                      "Password": passwordController.text,
                                      "PasswordConfirm": passConfController.text,
                                    });
                                  }
                                } catch (e) {
                                  authResult = AuthenticateResult.fromMap({'success': false, 'message': 'Connection error. Please check your internet.'});
                                } finally {
                                  if (mounted) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }

                                if (authResult.success) {
                                  if (resetPhase == ResetPhase.execute) {
                                    Alert.success("Password successfully reset!");
                                    Navigator.pop(context);
                                    return;
                                  }

                                  setState(() {
                                    resetPhase = switch (resetPhase) {
                                      ResetPhase.initiate => ResetPhase.authenticate,
                                      ResetPhase.authenticate || ResetPhase.execute => ResetPhase.execute,
                                    };
                                  });
                                } else {
                                  Alert.error(authResult.message);
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 18),
                          if (resetPhase == ResetPhase.authenticate) ...[
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  "Never received your verification code?",
                                  style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff1f2a3d)),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () async {
                                    var authResult = await Api.requestReset({"Email": emailController.text});
                                    if (!authResult.success) {
                                      Alert.error(authResult.message);
                                    } else {
                                      Alert.success("Verification code resent!");
                                      setState(() {
                                        isGoodState = true;
                                      });
                                      Timer(const Duration(seconds: 4), () {
                                        if (mounted) {
                                          setState(() {
                                            isGoodState = false;
                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Send Code Again",
                                    style: theme.textTheme.displayLarge!.copyWith(fontSize: 14, color: secondaryColor, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                          ],
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Remembered your password?",
                                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff1f2a3d)),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Sign In",
                                  style: theme.textTheme.displayLarge!.copyWith(fontSize: 14, color: secondaryColor, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16 + MediaQuery.of(context).padding.bottom),
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
    if (emailController.text.isEmpty) {
      return "Email is required.";
    }
    if (resetPhase == ResetPhase.authenticate && tokenController.text.isEmpty) {
      return "Verification code is required.";
    }
    if (resetPhase == ResetPhase.execute) {
      if (passwordController.text.isEmpty) return "Password is required.";
      if (passwordController.text.length < 6) return "Password must be at least 6 characters.";
      if (passwordController.text != passConfController.text) return "Passwords do not match.";
    }
    return null;
  }
}

enum ResetPhase { initiate, authenticate, execute }
