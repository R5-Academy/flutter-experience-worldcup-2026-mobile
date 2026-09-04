import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';

final class AppTextStyles._() {
  static TextStyle get display => GoogleFonts.archivoBlack(
    fontSize: 36,
    fontWeight: .w400,
    letterSpacing: -0.5,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get heading => GoogleFonts.archivoBlack(
    fontSize: 22,
    fontWeight: .w400,
    letterSpacing: -0.5,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get stat => GoogleFonts.archivoBlack(
    fontSize: 56,
    fontWeight: .w400,
    letterSpacing: -2,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get title => GoogleFonts.archivoBlack(
    fontSize: 16,
    fontWeight: .w400,
    letterSpacing: -0.3,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get subhead => GoogleFonts.archivoBlack(
    fontSize: 13,
    fontWeight: .w400,
    letterSpacing: -0.3,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get footnote => GoogleFonts.dmSans(
    fontSize: 10,
    fontWeight: .w500,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get code => GoogleFonts.archivoBlack(
    fontSize: 28,
    fontWeight: .w400,
    letterSpacing: -0.5,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get bodyBold => GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: .w700,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get body => GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: .w500,
    height: 1,
    color: AppColors.ink,
  );

  static TextStyle get paragraph => body.copyWith(height: 1.3);

  static TextStyle get input => body.copyWith(height: 1.5);

  static TextStyle get caption => GoogleFonts.dmSans(
    fontSize: 10,
    fontWeight: .w700,
    height: 1,
    color: AppColors.ink,
  );
  static TextStyle get overline => caption.copyWith(letterSpacing: 2);

  static TextStyle get mono => GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: .w400,
    height: 1,
    color: AppColors.ink,
  );

  static const emoji = TextStyle(
    inherit: false,
    fontSize: 14,
    color: AppColors.ink,
    fontFamilyFallback: ['Apple Color Emoji', 'Noto Color Emoji'],
  );

  static TextStyle get button => GoogleFonts.archivoBlack(
    fontSize: 14,
    fontWeight: .w400,
    letterSpacing: 1,
    height: 1,
    color: AppColors.ink,
  );

  static TextTheme get textTheme => TextTheme(
    displaySmall: display,
    headlineSmall: heading,
    titleMedium: bodyBold,
    bodyLarge: input,
    bodyMedium: paragraph,
    bodySmall: mono,
    labelLarge: button,
    labelSmall: caption,
  );
}
