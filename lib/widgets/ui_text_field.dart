import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class UITextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final bool autofocus;
  final TextAlign? textAlign;
  final bool readOnly;
  final bool? showCursor;
  final bool enabled;
  final EdgeInsets? padding;
  final AutovalidateMode? autoValidateMode;
  final String obscuringCharacter;
  final bool obscureText, dismissible;
  final bool autocorrect;
  final String? headerText;
  final SmartDashesType? smartDashesType;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final int? minLines;
  final bool expands, canRequestFocus;
  final TextStyle? headerStyle;
  final double? gapUnderHeader, height;
  final int? maxLength;
  final bool hideCounter;
  final String? helperText;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;
  final TextStyle? errorStyle;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final Widget? prefix;
  final Color? filledColor;
  final Color? borderColor;
  final double borderRadius;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? customHeader;
  final void Function(String?)? onChange;
  final void Function()? onTap;
  final void Function(String?)? onSubmit;
  final void Function()? onEditingComplete;
  final ScrollController? scrollController;

  const UITextField({
    super.key,
    this.autofocus = false,
    this.onChange,
    this.onTap,
    this.dismissible = true,
    this.onSubmit,
    this.height,
    this.onEditingComplete,
    this.canRequestFocus = true,
    this.textAlign,
    this.headerText,
    this.customHeader,
    this.readOnly = false,
    this.padding,
    this.smartDashesType,
    this.filledColor,
    this.helperText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.labelText,
    this.enabled = true,
    this.hintStyle,
    this.gapUnderHeader,
    this.headerStyle,
    this.labelStyle,
    this.helperStyle,
    this.errorStyle,
    this.formatter,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.showCursor,
    this.obscuringCharacter = '*',
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.hideCounter = false,
    this.style,
    this.validator,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.suffix,
    this.prefix,
    this.autocorrect = true,
    this.borderColor,
    this.borderRadius = 8,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.scrollController,
  });

  InputBorder? _resolvedBorder(InputBorder? explicit, InputBorder? theme) {
    if (explicit != null) return explicit;
    if (borderColor != null) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor!, width: 0.5),
      );
    }
    return theme;
  }

  @override
  Widget build(BuildContext context) {
    if (headerText != null || customHeader != null) {
      return Column(
        spacing: gapUnderHeader ?? 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customHeader ?? Text(headerText!, style: headerStyle ),
          _textField(context),
        ],
      );
    }
    return _textField(context);
  }

  Widget _textField(BuildContext context) {
    final InputDecorationThemeData decoration = Theme.of(context).inputDecorationTheme;

    return SizedBox(
      height: height,
      child: TextFormField(
        obscureText: obscureText,
        enabled: enabled,
        canRequestFocus: canRequestFocus,
        onChanged: onChange,
        onTap: onTap,

        onTapOutside: dismissible ? (_) => FocusScope.of(context).unfocus() : null,
        obscuringCharacter: obscuringCharacter,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        inputFormatters: formatter,
        controller: controller,
        focusNode: focusNode,
        textAlign: textAlign ?? TextAlign.start,
        onFieldSubmitted: onSubmit,
        onEditingComplete: onEditingComplete,
        initialValue: initialValue,
        validator: validator,
        autofocus: autofocus,
        readOnly: readOnly,
        showCursor: showCursor,
        autocorrect: autocorrect,
        smartDashesType: smartDashesType,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        maxLength: maxLength,
        scrollController: scrollController,
        style: style ,
        autovalidateMode: autoValidateMode,
        decoration: InputDecoration(
          focusedBorder: _resolvedBorder(focusedBorder ?? border, decoration.focusedBorder),
          enabledBorder: _resolvedBorder(enabledBorder ?? border, decoration.enabledBorder),
          errorBorder: decoration.errorBorder,
          focusedErrorBorder: decoration.focusedErrorBorder,
          disabledBorder: decoration.disabledBorder,
          border: _resolvedBorder(border, decoration.border),
          filled: filledColor != null,
          fillColor: filledColor ?? decoration.fillColor,
          isDense: decoration.isDense,
          prefixIcon: prefix,
          suffixIcon: suffix,
          enabled: enabled,
          labelText: labelText,
          hintText: hintText,
          helperText: helperText,
          labelStyle: labelStyle ,
          hintStyle: hintStyle ,
          helperStyle: helperStyle,
          errorStyle: errorStyle ,
          contentPadding: padding,
          counterText: hideCounter ? '' : null,
        ),
      ),
    );
  }
}