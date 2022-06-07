import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyle {
  ///Font Size
  static const double small_font_size = 11.0;
  static const double xSmall_font_size = 12.0;

  static const double regular_font_size = 13.0;
  static const double xRegular_font_size = 14.0;

  static const double medium_font_size = 16.0;
  static const double xMedium_font_size = 18.0;

  static const double large_font_size = 20.0;
  static const double xLarge_font_size = 32.0;


  ///small

  static final TextStyle robotoSmallWhite = TextStyle(
    fontSize: small_font_size,
    color: AppColors.white,
  );

  static final TextStyle robotoSmallRed = TextStyle(
    fontSize: small_font_size,
    color: AppColors.red,
  );
  static final TextStyle robotoSmallPrimary = TextStyle(
    fontSize: small_font_size,
    color: AppColors.primaryColor,
  );


  ///x small
  static final TextStyle robotoXSmallBlack = TextStyle(
    fontSize: xSmall_font_size,
    color: AppColors.black,
  );

  static final TextStyle robotoXSmallWhite = TextStyle(
    fontSize: xSmall_font_size,
    color: AppColors.white,
  );

  ///Regular
  static final TextStyle robotoRegularBlack = TextStyle(
    fontSize: regular_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoRegularSecondary = TextStyle(
    fontSize: regular_font_size,
    color: AppColors.secondaryColor,
  );
  static final TextStyle robotoRegularRed = TextStyle(
    fontSize: regular_font_size,
    color: AppColors.red,
  );
  static final TextStyle robotoRegularWhite = TextStyle(
    fontSize: regular_font_size,
    color: AppColors.white,
  );


  static final TextStyle robotoXRegularWhite = TextStyle(
    fontSize: xRegular_font_size,
    color: AppColors.white,
  );

  ///medium


  static final TextStyle robotoXMediumBlack = TextStyle(
    fontSize: xMedium_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoMediumBlack = TextStyle(
    fontSize: medium_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoMediumWhite = TextStyle(
    fontSize: medium_font_size,
    color: AppColors.white,
  );
  static final TextStyle robotoMediumPrimary = TextStyle(
    fontSize: medium_font_size,
    color: AppColors.primaryColor,
  );
  static final TextStyle robotoMediumPrimaryBold = TextStyle(
    fontSize: medium_font_size,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle openSansMediumCyanBold = TextStyle(
      color: Colors.cyan,
      fontSize: medium_font_size,
      fontWeight: FontWeight.bold
  );






  ///Regular
  static final TextStyle openSansRegular = TextStyle(
    fontSize: regular_font_size,
  );

  static final TextStyle openSansRegularSecondary = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: regular_font_size,
  );




  ///large
  ///

  static final TextStyle openSansLargePrimary = TextStyle(
    color: AppColors.primaryColor,
    fontSize: large_font_size,
  );

  static final TextStyle openSansLargePrimaryBold = TextStyle(
    color: AppColors.primaryColor,
    fontSize: large_font_size,
    fontWeight: FontWeight.bold
  );

  static final TextStyle openSansLargeSecondary = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: large_font_size,
  );

  static final TextStyle openSansLargeCyanBold = TextStyle(
    color: Colors.cyan,
    fontSize: xLarge_font_size,
    fontWeight: FontWeight.bold
  );

  static final TextStyle openSansLargeGreen = TextStyle(
    color: AppColors.green,
    fontSize: xLarge_font_size,
    fontWeight: FontWeight.w500
  );

  static final TextStyle openSansLargeWhiteBold =TextStyle(
    fontSize: large_font_size,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle openSansLargeBlockBold =TextStyle(
    fontSize: large_font_size,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static final TextStyle robotoLargeBlack = TextStyle(
    fontSize: large_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoLargeWhite = TextStyle(
    fontSize: large_font_size,
    color: AppColors.white,
  );

  static final TextStyle robotoLargeRed = TextStyle(
    fontSize: large_font_size,
    color: AppColors.red,
  );
  static final TextStyle robotoLargeSecondary = TextStyle(
    fontSize: large_font_size,
    color: AppColors.secondaryColor,
  );
}
