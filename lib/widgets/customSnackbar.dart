import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';

SnackBar customSnackbar(
    {required String title, Color bgColor = ColorConstants.primaryColor}) {
  return SnackBar(backgroundColor: bgColor, content: Text(title));
}
