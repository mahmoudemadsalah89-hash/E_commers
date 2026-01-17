
import 'package:flutter/material.dart';
import 'package:t_stroy/utils/contents/colors.dart';
import 'package:t_stroy/utils/theme/custom/appbar_theme.dart';
import 'package:t_stroy/utils/theme/custom/bottom_sheet_theme.dart';
import 'package:t_stroy/utils/theme/custom/checkbox_theme.dart';
import 'package:t_stroy/utils/theme/custom/chip_theme.dart';
import 'package:t_stroy/utils/theme/custom/elevated_button_theme.dart';
import 'package:t_stroy/utils/theme/custom/outlined_button_theme.dart';
import 'package:t_stroy/utils/theme/custom/text_field_theme.dart';
import 'package:t_stroy/utils/theme/custom/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData LightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "poppins",
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: TColors.primary,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheeme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    scaffoldBackgroundColor: TColors.primary.withOpacity(0.1),
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}

