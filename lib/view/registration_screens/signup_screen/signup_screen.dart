import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';
import 'package:my_leo/utils/functions/validations.dart';
import 'package:my_leo/utils/style/stringStyles.dart';
import 'package:my_leo/view/registration_screens/registrationController.dart';
import 'package:my_leo/widgets/buttonWidget.dart';
import 'package:my_leo/widgets/textfeildWidget.dart';
import 'package:stacked/stacked.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.clear();
    _confirmPasswordController.clear();
    _passwordController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {


    return ViewModelBuilder.reactive(viewModelBuilder: () => RegistrationController(), builder: (context, viewModel, child) =>  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Sign Up', style: Stringstyles.subHeadingStyle()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign up to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextfeildWidget(
                      controller: _nameController,
                      label: 'Name',
                      validation: (value) => Validations.validateName(value),
                    ),
                    const SizedBox(height: 16),
                    TextfeildWidget(
                      controller: _emailController,
                      label: 'Email',
                      validation: (value) => Validations.validateEmail(value),
                    ),
                    const SizedBox(height: 16),
                    TextfeildWidget(
                      controller: _passwordController,
                      wantObscure: true,
                      label: 'Password',
                      validation: (value) =>
                          Validations.validatePassword(value),
                    ),
                    const SizedBox(height: 16),
                    TextfeildWidget(
                      wantObscure: true,
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      validation: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    viewModel.isRegLoading
                        ? const CircularProgressIndicator(
                            color: ColorConstants.primaryColor,
                          )
                        : ButtonWidget(
                            width: 200,
                            label: 'Signup',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                viewModel.createUser(
                                    name: _nameController.text,
                                    context: context,
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              }
                            },
                          )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ',
                      style: TextStyle(fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
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
    ),);
  }
}
