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
        primary: PColors.primary,
        onPrimary: PColors.background,
        primaryContainer: PColors.primaryDark,
        secondary: PColors.secondary,
        onSecondary: PColors.textPrimary,
        secondaryContainer: PColors.secondaryDark,
        tertiary: PColors.accent,
        onTertiary: PColors.textPrimary,
        surface: PColors.cardBackground,
        onSurface: PColors.textPrimary,
        surfaceContainerHighest: PColors.subtleSurface,
        error: PColors.accent,
        onError: PColors.textPrimary,
        outline: PColors.textSecondary,
      ),

      // ========== Scaffold ==========
      scaffoldBackgroundColor: PColors.background,

      // ========== AppBar ==========
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: PColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypo .screenTitle,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      // ========== Card ==========
      cardTheme: CardThemeData(
        color: PColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusCard),
          side: BorderSide(
            color: PColors.glassBorder,
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
          foregroundColor: PColors.primary,
          minimumSize: const Size(double.infinity, AppConst.inputHeight),
          side: const BorderSide(color: PColors.primary, width: 1.5),
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
          foregroundColor: PColors.primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ========== Input Decoration ==========
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: PColors.cardBackground,
        hintStyle: const TextStyle(
          color: PColors.textSecondary,
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
            color: PColors.glassBorder,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: const BorderSide(
            color: PColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: const BorderSide(
            color: PColors.accent,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          borderSide: const BorderSide(
            color: PColors.accent,
            width: 1.5,
          ),
        ),
      ),

      // ========== Search Bar Theme (Material 3) ==========
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStateProperty.all(PColors.cardBackground),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.radiusInput),
            side: BorderSide(
              color: PColors.glassBorder,
              width: 1.0,
            ),
          ),
        ),
        hintStyle: WidgetStateProperty.all(
          const TextStyle(
            color: PColors.textSecondary,
            fontSize: 14,
          ),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            color: PColors.textPrimary,
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
        backgroundColor: PColors.cardBackground,
        selectedItemColor: PColors.primary,
        unselectedItemColor: PColors.textSecondary,
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
        backgroundColor: PColors.cardBackground,
        contentTextStyle: const TextStyle(
          color: PColors.textPrimary,
          fontSize: 14,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusInput),
          side: BorderSide(
            color: PColors.glassBorder,
            width: 1.0,
          ),
        ),
      ),

      // ========== Dialog ==========
      dialogTheme: DialogThemeData(
        backgroundColor: PColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppConst.radiusCard)),
          side: const BorderSide(
            color: PColors.glassBorder,
            width: 1.0,
          ),
        ),
        titleTextStyle: AppTypo .sectionHeader,
        contentTextStyle: AppTypo .subtitle,
      ),
      // ========== Bottom Sheet ==========
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: PColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConst.radiusCard),
          ),
        ),
        modalBackgroundColor: PColors.cardBackground,
      ),

      // ========== Chip Theme ==========
      chipTheme: ChipThemeData(
        backgroundColor: PColors.cardBackground,
        selectedColor: PColors.primary.withOpacity(0.15),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: PColors.textPrimary,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: PColors.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusChip),
          side: BorderSide(
            color: PColors.glassBorder,
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
        activeTrackColor: PColors.primary,
        inactiveTrackColor: PColors.primary.withOpacity(0.2),
        thumbColor: PColors.primary,
        overlayColor: PColors.primary.withOpacity(0.1),
        valueIndicatorColor: PColors.primary,
        valueIndicatorTextStyle: const TextStyle(
          color: PColors.background,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),

      // ========== Checkbox Theme ==========
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return PColors.primary;
            }
            return PColors.textSecondary;
          },
        ),
        checkColor: WidgetStateProperty.all(PColors.background),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: const BorderSide(
          color: PColors.textSecondary,
          width: 1.5,
        ),
      ),

      // ========== Radio Theme ==========
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return PColors.primary;
            }
            return PColors.textSecondary;
          },
        ),
      ),

      // ========== Switch Theme ==========
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return PColors.primary;
            }
            return PColors.textSecondary;
          },
        ),
        trackColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return PColors.primary.withOpacity(0.3);
            }
            return PColors.textSecondary.withOpacity(0.2);
          },
        ),
      ),

      // ========== Progress Indicator ==========
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: PColors.primary,
        linearTrackColor: PColors.cardBackground,
        circularTrackColor: PColors.cardBackground,
      ),

      // ========== Tab Bar ==========
      tabBarTheme:   TabBarThemeData(
        labelColor: PColors.primary,
        unselectedLabelColor: PColors.textSecondary,
        indicatorColor: PColors.primary,
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
        color: PColors.textPrimary,
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
        tileColor: PColors.cardBackground,
        textColor: PColors.textPrimary,
        iconColor: PColors.textSecondary,
      ),

      // ========== Tooltip ==========
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: PColors.cardBackground,
          borderRadius: BorderRadius.circular(AppConst.radiusTag),
          border: Border.all(
            color: PColors.glassBorder,
            width: 1.0,
          ),
        ),
        textStyle: const TextStyle(
          color: PColors.textPrimary,
          fontSize: 12,
        ),
      ),
    );
  }
}