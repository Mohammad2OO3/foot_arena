import 'package:flutter/material.dart';
import 'colors.dart';
import 'typo.dart';
import 'const.dart';
import 'decorations.dart';

class AppTheme {
  AppTheme._();

  /// الثيم الأساسي الداكن - هوية رياضية + Glassmorphism
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // ========== Color Scheme ==========
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.background,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondary,
        onSecondary: AppColors.textPrimary,
        secondaryContainer: AppColors.secondaryDark,
        tertiary: AppColors.accent,
        onTertiary: AppColors.textPrimary,
        surface: AppColors.cardBackground,
        onSurface: AppColors.textPrimary,
        surfaceContainerHighest: AppColors.subtleSurface,
        error: AppColors.accent,
        onError: AppColors.textPrimary,
        outline: AppColors.textSecondary,
      ),

      // ========== Scaffold ==========
      scaffoldBackgroundColor: AppColors.background,

      // ========== AppBar ==========
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypo .screenTitle,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      // ========== Card ==========
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusCard),
          side: BorderSide(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      // ========== Elevated Button ==========
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppDecorations.primaryButton(),
      ),

      // ========== Outlined Button ==========
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, AppConst.inputHeight),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.radiusInput),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ========== Text Button ==========
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ========== Input Decoration ==========
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardBackground,
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: BorderSide(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: const BorderSide(
            color: AppColors.accent,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: const BorderSide(
            color: AppColors.accent,
            width: 1.5,
          ),
        ),
      ),

      // ========== Search Bar Theme (Material 3) ==========
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStateProperty.all(AppColors.cardBackground),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.radiusInput),
            side: BorderSide(
              color: AppColors.glassBorder,
              width: 1.0,
            ),
          ),
        ),
        hintStyle: WidgetStateProperty.all(
          const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
          ),
        ),
      ),

      // ========== Divider ==========
      dividerTheme: const DividerThemeData(
        color: Color(0x0DFFFFFF), // white with 5% opacity
        thickness: 1,
        space: AppConst.spacingLg,
      ),

      // ========== Bottom Navigation Bar ==========
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),

      // ========== SnackBar ==========
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.cardBackground,
        contentTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          side: BorderSide(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
      ),

      // ========== Dialog ==========
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppConst.radiusCard)),
          side: const BorderSide(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
        titleTextStyle: AppTypo .sectionHeader,
        contentTextStyle: AppTypo .subtitle,
      ),
      // ========== Bottom Sheet ==========
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConst.radiusCard),
          ),
        ),
        modalBackgroundColor: AppColors.cardBackground,
      ),

      // ========== Chip Theme ==========
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.cardBackground,
        selectedColor: AppColors.primary.withOpacity(0.15),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusChip),
          side: BorderSide(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),

      // ========== Slider Theme ==========
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.primary.withOpacity(0.2),
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withOpacity(0.1),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: const TextStyle(
          color: AppColors.background,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),

      // ========== Checkbox Theme ==========
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.textSecondary;
          },
        ),
        checkColor: WidgetStateProperty.all(AppColors.background),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: const BorderSide(
          color: AppColors.textSecondary,
          width: 1.5,
        ),
      ),

      // ========== Radio Theme ==========
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.textSecondary;
          },
        ),
      ),

      // ========== Switch Theme ==========
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.textSecondary;
          },
        ),
        trackColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary.withOpacity(0.3);
            }
            return AppColors.textSecondary.withOpacity(0.2);
          },
        ),
      ),

      // ========== Progress Indicator ==========
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.cardBackground,
        circularTrackColor: AppColors.cardBackground,
      ),

      // ========== Tab Bar ==========
      tabBarTheme:   TabBarThemeData(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,
        indicatorColor: AppColors.primary,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        indicatorSize: TabBarIndicatorSize.label,
      ),

      // ========== Text Theme (Global) ==========
      textTheme: const TextTheme(
        displayLarge: AppTypo .screenTitle,
        displayMedium: AppTypo .sectionHeader,
        displaySmall: AppTypo .cardTitle,
        headlineMedium: AppTypo .cardTitle,
        headlineSmall: AppTypo .cardTitle,
        titleLarge: AppTypo .sectionHeader,
        titleMedium: AppTypo .cardTitle,
        titleSmall: AppTypo .subtitle,
        bodyLarge: AppTypo .subtitle,
        bodyMedium: AppTypo .subtitle,
        bodySmall: AppTypo .caption,
        labelLarge: AppTypo .buttonLarge,
        labelMedium: AppTypo .buttonMedium,
        labelSmall: AppTypo .buttonSmall,
      ),

      // ========== Icon Theme ==========
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: AppConst.iconLg,
      ),

      // ========== List Tile ==========
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConst.screenPaddingHorizontal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusCard),
        ),
        tileColor: AppColors.cardBackground,
        textColor: AppColors.textPrimary,
        iconColor: AppColors.textSecondary,
      ),

      // ========== Tooltip ==========
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppConst.radiusTag),
          border: Border.all(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
        textStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
        ),
      ),
    );
  }
}