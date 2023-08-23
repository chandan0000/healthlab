import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  // Theme config for FlexColorScheme version 7.1.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
  static final themeLight = FlexThemeData.light(
    scheme: FlexScheme.flutterDash,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the Playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.notoSans().fontFamily,
  );

  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.flutterDash,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the Playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.notoSans().fontFamily,
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
