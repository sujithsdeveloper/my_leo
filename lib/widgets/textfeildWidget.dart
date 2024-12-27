import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';
import 'package:my_leo/utils/style/stringStyles.dart';
import 'package:my_leo/widgets/widgetViewModel.dart';
import 'package:stacked/stacked.dart';

class TextfeildWidget extends StatelessWidget {
  const TextfeildWidget({
    super.key,
    required this.controller,
    required this.label,
    this.validation,
    this.wantObscure = false,
    this.keyboardType = TextInputType.text,
    this.heading,
    this.wantHeading = false,
    this.historyController,
    this.wantSuffix = false,
    this.suffIcon,
  });

  final TextEditingController controller;
  final String label;
  final bool wantSuffix;
  final String? Function(String?)? validation;
  final bool wantObscure;
  final TextInputType keyboardType;
  final bool wantHeading;
  final String? heading;
  final UndoHistoryController? historyController;
  final IconButton? suffIcon;

  @override
  Widget build(BuildContext context) {
    return wantHeading
        ? ViewModelBuilder.reactive(
            viewModelBuilder: () => Widgetcontroller(),
            builder: (context, viewModel, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading.toString(),
                  style: Stringstyles.subHeadingStyle(),
                ),
                SizedBox(height: 5),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: keyboardType,
                  cursorColor: Colors.black,
                  controller: controller,
                  obscureText: wantObscure ? viewModel.textIsobscure : false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor)),
                    suffixIcon: wantObscure
                        ? IconButton(
                            onPressed: () {
                              viewModel.isObscure();
                            },
                            icon: viewModel.textIsobscure
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ))
                        : null,
                    labelText: label,
                    labelStyle: TextStyle(color: ColorConstants.primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: ColorConstants.primaryColor),
                    ),
                  ),
                  validator: validation,
                )
              ],
            ),
          )
        : ViewModelBuilder.reactive(
            viewModelBuilder: () => Widgetcontroller(),
            builder: (context, viewModel, child) => TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: keyboardType,
              cursorColor: Colors.black,
              controller: controller,
              obscureText: wantObscure ? viewModel.textIsobscure : false,
              decoration: InputDecoration(
                suffix: wantSuffix ? suffIcon : null,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.primaryColor)),
                suffixIcon: wantObscure
                    ? IconButton(
                        onPressed: () {
                          viewModel.isObscure();
                        },
                        icon: viewModel.textIsobscure
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ))
                    : null,
                labelText: label,
                labelStyle: TextStyle(color: ColorConstants.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorConstants.primaryColor),
                ),
              ),
              validator: validation,
            ),
          );
  }
}
