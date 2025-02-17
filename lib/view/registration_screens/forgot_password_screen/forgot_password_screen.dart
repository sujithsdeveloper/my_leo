import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';
import 'package:my_leo/utils/functions/validations.dart';
import 'package:my_leo/view/registration_screens/registrationController.dart';
import 'package:my_leo/widgets/buttonWidget.dart';
import 'package:my_leo/widgets/textfeildWidget.dart';
import 'package:stacked/stacked.dart';


class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder.reactive(viewModelBuilder: () => RegistrationController(), builder: (context, viewModel, child) =>  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reset Your Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email address below to receive a password reset link.',
                textAlign: TextAlign.center,
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
                      controller: _emailController,
                      label: 'Email',
                      validation: (p0) => Validations.validateEmail(p0),
                    ),
                    const SizedBox(height: 24),
                    viewModel.isPasswordLoading
                        ? const CircularProgressIndicator(color: ColorConstants.primaryColor,)
                        : ButtonWidget(
                          width: 200,
                            label: 'Rest',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                viewModel.resetPassword(
                                    email: _emailController.text,
                                    context: context);
                              }
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
