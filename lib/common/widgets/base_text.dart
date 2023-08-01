// reusable  text in home Scree
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';

Widget reusableText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  fontWeight = FontWeight.bold,
}) {
  return Text(text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize.sp,
      ));
}
