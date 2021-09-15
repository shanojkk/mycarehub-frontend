import 'package:flutter/material.dart';

import 'package:app_wrapper/app_wrapper.dart';

class AppTheme {
  static ThemeData getAppTheme(List<AppContext> contexts) {
    return ThemeData(
        fontFamily: 'Raleway',
        primaryColor: AppColors.silColors['primaryColor'],
        primaryColorDark: AppColors.silColors['primaryDark'],
        accentColor: AppColors.silColors['accentColor'],
        backgroundColor: AppColors.silColors['backgroundColor'],
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.silColors['textSelectionColor'],
        )).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
    );
  }
}

class AppColors {
  static const Color apaVirtualCardColor = Color(0xffbdbdbd);
  static const Color accentColor = Color(0xFF739A00);
  static const Color backgroundGreyColor = Color(0xFFF4F4F6);
  static const Color benefitsPayerColor = Color(0xFF2196F3);
  static const Color blackColor = Color(0xFF000000);
  static const Color cyanColor = Color(0xFF98DDE7);
  static const Color darkGreenColor = Color(0xFF388E3C);
  static const Color darkGreyColor = Color(0xFF9B9B9B);
  static const Color darkOrangeColor = Color(0xFFFFA000);
  static const Color greenColor = Color(0xFF50C878);
  static const Color greyColor = Color(0xFF828282);
  static const Color greyTextColor = Color(0xff7D8D9C);
  static const Color greySeparatorColor = Color(0xfff3f5f9);
  static const Color inputFieldColor = Color(0xFFF0F3FE);
  static const Color jubileeVirtualCardColor = Color(0xFFBD8F0B);
  static const Color lightBlueColor = Color(0xFFBCE0FA);
  static const Color lightGreyColor = Color(0xFFF7F7F7);
  static const Color lightPurpleCardBackground = Color(0xFFF6F7FB);
  static const Color lightPurpleCardBorder = Color(0xFFC6BAD7);
  static const Color lightPurpleTextColor = Color(0xFF596D8A);
  static const Color lightRed = Color(0xFFFFE6E6);
  static const Color lightSkyBlueColor = Color(0xFFF6F7FB);
  static const Color primaryColor = Color(0xFF603A8B);
  static const Color primaryColorLite = Color(0xFFF2E8FF);
  static const Color redColor = Color(0xFFE41518);
  static const Color resolutionVirtualCardColor = Color(0xFF233383);
  static const Map<String, Color> silColors = <String, Color>{
    'primaryColor': Color(0xFF603A8B),
    'primaryDark': Color(0xFF7949AF),
    'accentColor': Color(0xFF739A00),
    'backgroundColor': Color(0xFFF4F6FA),
    'textSelectionColor': Color(0xff0e2153),
  };
  static const Color coverInfoBackground = Color(0xFFE4EBF4);
  static const Color superLightGreyColor = Color(0xFFF2F2F2);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color darkGreyTextColor = Color(0xFF797979);
  static const Color lightPurpleBackgroundColor = Color(0xffE2E0F6);
  static const Color madisonCardDecorationColor = Color(0xFF66FFE6);
  static const Color madisonTitleColor = Color(0xFF213268);

  static const Color jubileePrimaryColor = Color(0xFFFF8C9F);
  static const Color jubileeSecondaryColor = Color(0xFFDCB270);
  static const Color apaPrimaryColor = Color(0xFFBBBEC4);
  static const Color apaSecondaryColor = Color(0xFF7C92B7);
  static const Color madisonPrimaryColor = Color(0xFF789CB7);
  static const Color madisonSecondaryColor = Color(0xFF7DCBBB);
  static const Color resolutionPrimaryColor = Color(0xFF6CBDD5);
  static const Color resolutionSecondaryColor = Color(0xFF486ABB);
  static const Color britamPrimaryColor = Color(0xFF43B9F0);
  static const Color britamSecondaryColor = Color(0xFFC0608D);
  static const Color introductionBackgroundColor = Color(0xFFF7F8FF);
}
