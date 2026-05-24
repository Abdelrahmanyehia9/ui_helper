import 'package:flutter/material.dart';
import 'ui_clickable.dart';

enum ButtonType { filled, outlined, text }

class UIButton extends StatelessWidget {
  final Widget? child, loadingPlaceHolder;
  final ButtonType buttonType;
  final Color? color, disabledColor, borderColor, loadingColor;
  final bool isDisabled, isLoading;
  final VoidCallback? onTap, onLongPress, onDoubleTap;
  final Size? fixedSize;
  final double? borderRadius, borderWidth;
  final EdgeInsetsGeometry? padding, margin;

  const UIButton({
    super.key,
    this.child,
    this.loadingPlaceHolder,
    this.buttonType = ButtonType.filled,
    this.color,
    this.disabledColor,
    this.borderColor,
    this.loadingColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.fixedSize,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.padding,
    this.margin,
  });

  factory UIButton.text(
      String text, {
        TextStyle? style,
        Color? textColor,
        Color? disabledColor,
        Color? loadingColor,
        Widget? loadingPlaceHolder,
        bool isDisabled = false,
        bool isLoading = false,
        double? borderRadius,
        double? borderWidth,
        Size? fixedSize,
        VoidCallback? onTap,
        VoidCallback? onLongPress,
        VoidCallback? onDoubleTap,
        EdgeInsetsGeometry? padding,
        EdgeInsetsGeometry? margin,
      }) =>
      UIButton(
        buttonType: ButtonType.text,
        color: textColor,
        disabledColor: disabledColor,
        loadingColor: loadingColor,
        loadingPlaceHolder: loadingPlaceHolder,
        isDisabled: isDisabled,
        isLoading: isLoading,
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        fixedSize: fixedSize,
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        padding: padding,
        margin: margin,
        child: Text(
          text,
          style: style?.copyWith(color: textColor) ?? TextStyle(color: textColor),
        ),
      );

  factory UIButton.filled(
      String text, {
        TextStyle? style,
        Color? backgroundColor,
        Color? textColor,
        Color? disabledColor,
        Color? loadingColor,
        Widget? loadingPlaceHolder,
        bool isDisabled = false,
        bool isLoading = false,
        double? borderRadius,
        double? borderWidth,
        Size fixedSize = const Size(double.infinity, 45),
        VoidCallback? onTap,
        VoidCallback? onLongPress,
        VoidCallback? onDoubleTap,
        EdgeInsetsGeometry? padding,
        EdgeInsetsGeometry? margin,
      }) =>
      UIButton(
        buttonType: ButtonType.filled,
        color: backgroundColor,
        disabledColor: disabledColor,
        loadingColor: loadingColor,
        loadingPlaceHolder: loadingPlaceHolder,
        isDisabled: isDisabled,
        isLoading: isLoading,
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        fixedSize: fixedSize,
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        padding: padding,
        margin: margin,
        child: Text(
          text,
          style: style?.copyWith(color: textColor ?? Colors.white) ??
              TextStyle(color: textColor ?? Colors.white),
        ),
      );

  factory UIButton.outlined(
      String text, {
        TextStyle? style,
        Color? borderColor,
        Color? textColor,
        Color? disabledColor,
        Color? loadingColor,
        Widget? loadingPlaceHolder,
        bool isDisabled = false,
        bool isLoading = false,
        double? borderRadius,
        double? borderWidth,
        Size fixedSize = const Size(double.infinity, 45),
        VoidCallback? onTap,
        VoidCallback? onLongPress,
        VoidCallback? onDoubleTap,
        EdgeInsetsGeometry? padding,
        EdgeInsetsGeometry? margin,
      }) =>
      UIButton(
        buttonType: ButtonType.outlined,
        color: Colors.transparent,
        borderColor: borderColor,
        disabledColor: disabledColor,
        loadingColor: loadingColor,
        loadingPlaceHolder: loadingPlaceHolder,
        isDisabled: isDisabled,
        isLoading: isLoading,
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        fixedSize: fixedSize,
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        padding: padding,
        margin: margin,
        child: Text(
          text,
          style: style?.copyWith(color: textColor ?? borderColor) ??
              TextStyle(color: textColor ?? borderColor),
        ),
      );

  bool get isClickable => !isDisabled && !isLoading;

  @override
  Widget build(BuildContext context) {
    return UIClickable(
      onTap: isClickable ? onTap : null,
      onDoubleTap: isClickable ? onDoubleTap : null,
      onLongPress: isClickable ? onLongPress : null,
      child: Container(
        alignment: Alignment.center,
        width: fixedSize?.width,
        height: fixedSize?.height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: isDisabled ? _resolvedDisabledColor(context) : _resolvedColor(context),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.2,
          ),
        ),
        child: isLoading ? _buildLoading() : child,
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: loadingPlaceHolder ?? CircularProgressIndicator(color: loadingColor),
    );
  }

  Color _resolvedColor(BuildContext context) =>
      buttonType == ButtonType.filled
          ? color ?? Theme.of(context).primaryColor
          : Colors.transparent;

  Color _resolvedDisabledColor(BuildContext context) =>
      disabledColor ?? Theme.of(context).disabledColor;
}