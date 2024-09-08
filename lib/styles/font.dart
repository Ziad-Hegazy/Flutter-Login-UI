import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';

class AppTextStyles {
  static TextStyle mainTitle = TextStyle(
      color: AppColors.secondary, fontSize: 36, fontWeight: FontWeight.w400);
  static TextStyle mainText = TextStyle(
      color: AppColors.light, fontSize: 20, fontWeight: FontWeight.w300);
  static TextStyle small = TextStyle(
      color: AppColors.accent, fontSize: 11, fontWeight: FontWeight.w400);
  static TextStyle sheetTitle = TextStyle(
      color: AppColors.primary,
      fontFamily: 'SegoeUI',
      fontVariations: [FontVariation('wght', 700)],
      fontSize: 30);
  static TextStyle buttonText = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
    fontSize: 20,
  );
  static TextStyle sheetText = TextStyle(
    color: AppColors.primary,
    fontSize: 20,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 400)],
  );
  static TextStyle sheetTextButton = TextStyle(
    color: AppColors.secondary,
    fontSize: 20,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
  );
  static TextStyle FieldText = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 400)],
    fontSize: 18,
    color: AppColors.primary,
  );
}
