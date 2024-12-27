import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';
import 'package:my_leo/utils/functions/validations.dart';
import 'package:my_leo/utils/style/stringStyles.dart';
import 'package:my_leo/view/registration_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:my_leo/view/registration_screens/registrationController.dart';
import 'package:my_leo/view/registration_screens/signup_screen/signup_screen.dart';
import 'package:my_leo/widgets/buttonWidget.dart';
import 'package:my_leo/widgets/textfeildWidget.dart';

import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegistrationController(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Login', style: Stringstyles.subHeadingStyle()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please login to your account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextfeildWidget(
                        wantObscure: false,
                        controller: _emailController,
                        label: 'Email',
                        validation: (p0) => Validations.validateEmail(p0),
                      ),
                      const SizedBox(height: 16),
                      TextfeildWidget(
                        controller: _passwordController,
                        wantObscure: true,
                        label: 'Password',
                        validation: (p0) => Validations.validatePassword(p0),
                      ),
                      const SizedBox(height: 24),
                      viewModel.isLoginLoading
                          ? const CircularProgressIndicator(
                              color: ColorConstants.primaryColor,
                            )
                          : ButtonWidget(
                              width: 200,
                              label: 'Login',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  viewModel.login(
                                    context: context,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                }
                              },
                            )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account?',
                        style: TextStyle(fontSize: 14)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create one',
                        style: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
