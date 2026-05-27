// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:skillroot/routes.dart';

import 'package:skillroot/widgets/buttons.dart';
import 'package:skillroot/widgets/text_fields.dart';
import 'package:skillroot/widgets/auth_elements.dart';

import 'package:skillroot/services/api.dart';
import 'package:skillroot/services/alert.dart';
import 'package:skillroot/services/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfController = TextEditingController();
  TextEditingController firstNamController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

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
                      "Create your skill passport.",
                      style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withOpacity(0.18)),
                      ),
                      child: Text(
                        "Build a verified record of your training, work, and credentials.",
                        style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white.withOpacity(0.92)),
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
                          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 24, offset: const Offset(0, 12)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create account",
                            style: theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, color: Color(0xff1f2a3d), letterSpacing: -0.2),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Set up your portable proof of work.",
                            style: theme.textTheme.bodyMedium!.copyWith(color: Color(0xff5c667a)),
                          ),
                          const SizedBox(height: 18),
                          UnderlinedTextField(hintText: "First Name", controller: firstNamController, isRequired: true),
                          const SizedBox(height: 14),
                          UnderlinedTextField(hintText: "Last Name", controller: lastNameController, isRequired: true),
                          const SizedBox(height: 14),
                          UnderlinedTextField(hintText: "Email", controller: emailAddController, isRequired: true, keyboardtype: TextInputType.emailAddress),
                          const SizedBox(height: 14),
                          UnderlinedTextField(hintText: "Phone", controller: phoneNumController, isRequired: true, keyboardtype: TextInputType.phone),
                          const SizedBox(height: 14),
                          const SizedBox(height: 14),
                          UnderlinedTextField(hintText: "Create Password", controller: passwordController, suffixIcon: Image.asset(ThemeStrings.v58, height: 25), isPasswordField: true, isRequired: true),
                          const SizedBox(height: 14),
                          UnderlinedTextField(hintText: "Confirm Password", controller: passConfController, suffixIcon: Image.asset(ThemeStrings.v58, height: 25), isPasswordField: true, isRequired: true),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: primaryColor.withOpacity(0.35), blurRadius: 22, offset: const Offset(0, 10))],
                            ),
                            child: RoundedFlatButton(
                              name: "CREATE ACCOUNT",
                              isLoading: isLoading,
                              click: () async {
                                String? validation = validateInput();

                                if (validation != null) {
                                  Alert.error(validation);
                                  return;
                                }

                                setState(() {
                                  isLoading = true;
                                });

                                RegisterResult regResult;
                                try {
                                  regResult = await Api.register(
                                    password: passwordController.text,
                                    passwordConfirmation: passConfController.text,
                                    firstName: firstNamController.text,
                                    lastName: lastNameController.text,
                                    email: emailAddController.text,
                                    phone: phoneNumController.text,
                                  );
                                } catch (e) {
                                  regResult = RegisterResult.fromMap({'success': false, 'message': 'Connection error. Please check your internet.'});
                                } finally {
                                  if (mounted) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }

                                if (regResult.success) {
                                  Navigator.pushNamed(context, Routes.HOME);
                                } else {
                                  Alert.error(regResult.message);
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already a User?",
                                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff1f2a3d)),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.LOGIN);
                                },
                                child: Text(
                                  "Login",
                                  style: theme.textTheme.displayLarge!.copyWith(fontSize: 14, color: theme.primaryColor, fontWeight: FontWeight.bold),
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
    if (firstNamController.text.isEmpty) return "First name is required.";
    if (lastNameController.text.isEmpty) return "Last name is required.";
    if (emailAddController.text.isEmpty) return "Email is required.";
    if (phoneNumController.text.isEmpty) return "Phone number is required.";
    if (passwordController.text.isEmpty) return "Password is required.";
    if (passwordController.text.length < 6) return "Password must be at least 6 characters.";
    if (passwordController.text != passConfController.text) return "Passwords do not match.";
    return null;
  }
}
