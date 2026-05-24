import 'package:flutter/material.dart';
import 'package:ui_helper_kit/overlays/snackbars.dart';

extension NavExtension on BuildContext {
  Future<dynamic> push(Widget page, {bool maintainState = true}) async {
    Navigator.push(
      this,
      MaterialPageRoute(maintainState: maintainState, builder: (_) => page),
    );
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    return await Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedReplacement(
    String routeName, {
    Object? arguments,
  }) async {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void popUntilNamed(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  Future<dynamic> pushRoute(Route route) async {
    Navigator.of(this).push(route);
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) async {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop([dynamic result]) async => Navigator.of(this).pop(result);

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  bool get canPop => Navigator.of(this).canPop();
}

extension ThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;

  Color get cardColor => Theme.of(this).cardColor;

  Brightness get brightness => Theme.of(this).brightness;

  bool get isDark => brightness == Brightness.dark;

  Color get primary => colors.primary;

  Color get secondary => colors.secondary;

  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;
}

extension ScreenSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get safeTopArea => MediaQuery.of(this).padding.top;

  double get safeBottomArea => MediaQuery.of(this).padding.bottom;
}

extension SnackBarExt on BuildContext {
  void showSnackBars({
    required String message,
    String? title,
    Color? backgroundColor,
    Color borderColor = Colors.transparent,
    IconData? icon,
    LinearGradient? gradient,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    EdgeInsets? padding,
    double elevation = 0,
    required BuildContext context,
    Duration duration = const Duration(milliseconds: 1200),
  })
  {
    return SnackBars.custom(
      context: this,
      message,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      duration: duration,
      titleStyle: titleStyle,
      messageStyle: messageStyle,
      gradient: gradient,
      elevation: elevation,
      padding: padding,
      icon: icon,
      title: title,
    );
  }


  void successBar({
    required String message,
    String? title,
    Color backgroundColor = Colors.green,
    Color borderColor = Colors.transparent,
    IconData icon = Icons.check,
    LinearGradient? gradient,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    EdgeInsets? padding,
    double elevation = 0,
    required BuildContext context,
    Duration duration = const Duration(milliseconds: 1200),
  })
  {
    return SnackBars.custom(
      context: this,
      message,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      duration: duration,
      titleStyle: titleStyle,
      messageStyle: messageStyle,
      gradient: gradient,
      elevation: elevation,
      padding: padding,
      icon: icon,
      title: title,
    );
  }
  void errorBar({
    required String message,
    String? title,
    Color backgroundColor = Colors.red,
    Color borderColor = Colors.transparent,
    IconData icon = Icons.error,
    LinearGradient? gradient,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    EdgeInsets? padding,
    double elevation = 0,
    required BuildContext context,
    Duration duration = const Duration(milliseconds: 1200),
  })
  {
    return SnackBars.custom(
      context: this,
      message,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      duration: duration,
      titleStyle: titleStyle,
      messageStyle: messageStyle,
      gradient: gradient,
      elevation: elevation,
      padding: padding,
      icon: icon,
      title: title,
    );
  }
  void warningBar({
    required String message,
    String? title,
    Color backgroundColor = Colors.yellow,
    Color borderColor = Colors.transparent,
    IconData icon = Icons.warning,
    LinearGradient? gradient,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    EdgeInsets? padding,
    double elevation = 0,
    required BuildContext context,
    Duration duration = const Duration(milliseconds: 1200),
  })
  {
    return SnackBars.custom(
      context: this,
      message,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      duration: duration,
      titleStyle: titleStyle,
      messageStyle: messageStyle,
      gradient: gradient,
      elevation: elevation,
      padding: padding,
      icon: icon,
      title: title,
    );
  }
}

extension DirectionExt on BuildContext {
  bool get isRTL => Directionality.of(this) == TextDirection.rtl;
}
