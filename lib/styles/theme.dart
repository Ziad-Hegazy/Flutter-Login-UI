import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_application_1/styles/font.dart';

class AppTheme {
  static ThemeData main = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.primary,

    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.FieldText,
    ),
    bottomSheetTheme: ThemeData.light().bottomSheetTheme.copyWith(
          backgroundColor: AppColors.sheet,
        ),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextStyles.FieldText.copyWith(color: Colors.black54),
        hintStyle: AppTextStyles.FieldText.copyWith(color: Colors.black54),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.primary,
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(13),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.primary,
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(13),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.secondary,
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(13),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.secondary,
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(13),
        ),
        errorStyle: AppTextStyles.FieldText.copyWith(color:AppColors.secondary,fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: AppTextStyles.FieldText.copyWith(fontSize: 20),
        ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8),
        fixedSize: Size(300, 60),
        textStyle: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8),
        fixedSize: Size(300, 60),
        textStyle: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
        foregroundColor: AppColors.accent,
        side: BorderSide(
            width: 3,
            color: AppColors.accent,
            strokeAlign: BorderSide.strokeAlignOutside),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    ),
        elevatedButtonTheme: ElevatedButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8),
        fixedSize: Size(420, 60),
        textStyle: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.accent,
        shadowColor: AppColors.sheet,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    ),
  );
}
