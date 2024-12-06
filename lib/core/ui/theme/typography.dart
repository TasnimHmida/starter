import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static const FontWeight regular = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;

  static const String plusJakartaSans = "PlusJakartaSans";

  static final TextTheme textTheme = TextTheme(
    displayMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: plusJakartaSans,
      fontWeight: regular,
    ),
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontFamily: plusJakartaSans,
      fontWeight: bold,
    ),
  );
}
