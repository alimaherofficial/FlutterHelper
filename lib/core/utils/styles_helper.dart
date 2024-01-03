// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/font_size_helper.dart';
import 'package:helper/core/utils/font_weight_helper.dart';
import 'package:sizer/sizer.dart';

///regular style
TextStyle getRegularStyle({
  Color color = AppColors.text,
  double fontSize = FontSizeHelper.s13,
}) {
  return TextStyle(
    fontWeight: FontWeightHelper.regular,
    color: color,
    fontSize: fontSize.sp,
  );
}

//medium style
TextStyle getMediumStyle({
  Color color = AppColors.text,
  double fontSize = FontSizeHelper.s13,
}) {
  return TextStyle(
    fontWeight: FontWeightHelper.medium,
    color: color,
    fontSize: fontSize.sp,
  );
}

//light style
TextStyle getLightStyle({
  Color color = AppColors.text,
  double fontSize = FontSizeHelper.s13,
}) {
  return TextStyle(
    fontWeight: FontWeightHelper.light,
    color: color,
    fontSize: fontSize.sp,
  );
}

//semi-bold style
TextStyle getSemiBoldStyle({
  Color color = AppColors.text,
  double fontSize = FontSizeHelper.s13,
}) {
  return TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    color: color,
    fontSize: fontSize.sp,
  );
}

//bold style
TextStyle getBoldStyle({
  Color color = AppColors.text,
  double fontSize = FontSizeHelper.s13,
}) {
  return TextStyle(
    fontWeight: FontWeightHelper.bold,
    color: color,
    fontSize: fontSize.sp,
  );
}
