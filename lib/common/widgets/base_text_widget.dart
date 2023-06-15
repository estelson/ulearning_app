import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

///Reusable text widget
Widget reusableText({
  required String text,
  Color textColor = AppColors.primaryText,
  double marginTop = 20,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop.h),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}
