import 'package:flutter/material.dart';

class UIText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? textScaleFactor;
  final StrutStyle? strutStyle;
  final String? semanticsLabel;
  final Locale? locale;
  final bool selectable;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextSpan? textSpan;

  const UIText(
      this.text, {
        super.key,
        this.style,
        this.textAlign,
        this.textDirection,
        this.softWrap,
        this.overflow,
        this.maxLines,
        this.textScaleFactor,
        this.strutStyle,
        this.semanticsLabel,
        this.locale,
        this.selectable = false,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.textSpan,
      });



  @override
  Widget build(BuildContext context) {
    if ((text == null || text!.isEmpty) && textSpan == null) {
      return const SizedBox.shrink();
    }

    if (selectable) {
      return SelectableText(
        text ?? '',
        style: style,
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        textScaler: textScaleFactor != null
            ? TextScaler.linear(textScaleFactor!)
            : null,
        semanticsLabel: semanticsLabel,
      );
    }

    if (textSpan != null) {
      return Text.rich(
        textSpan!,
        style: style,
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        textScaler: textScaleFactor != null
            ? TextScaler.linear(textScaleFactor!)
            : null,
        strutStyle: strutStyle,
        locale: locale,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    }

    return Text(
      text!,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: textScaleFactor != null
          ? TextScaler.linear(textScaleFactor!)
          : null,
      strutStyle: strutStyle,
      locale: locale,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}