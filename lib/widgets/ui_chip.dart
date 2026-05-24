import 'package:flutter/material.dart';
import 'package:ui_helper_kit/widgets/ui_clickable.dart';

import '../extensions/colors.dart';
import '../extensions/context.dart';


class UIChip extends StatelessWidget {
  final double ? height, maxWidth, minWidth, maxHeight, minHeight, width,
      radius,
      paddingHr, paddingVr, marginHr, marginVr;
  final Color? color,   borderColor, titleColor;
  final BoxShape shape;
  final Clip? clipBehavior;
  final String? title;
  final Widget ? child;
  final TextStyle ? titleStyle;
  final bool monochromatic;
  final VoidCallback? onTap, onLongPress, onDoubleTap;

  const UIChip({super.key, this.height, this.width, this.monochromatic = false,
    this.title, this.child, this.titleStyle,
    this.color , this.borderColor,
    this.onTap, this.onLongPress, this.onDoubleTap,
    this.titleColor, this.shape = BoxShape.rectangle,
    this.clipBehavior, this.radius, this.paddingHr, this.paddingVr, this.marginHr, this.marginVr, this.maxWidth, this.minWidth, this.maxHeight, this.minHeight});

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? context.primary ;
    return UIClickable(
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: paddingHr ?? 8,
          vertical: paddingVr ?? 4,

        ),
        margin: EdgeInsets.symmetric(
          horizontal: marginHr ??0,
          vertical: marginVr ?? 0,
        ),
        decoration: BoxDecoration(
          color: monochromatic ? resolvedColor.veryLight : color,
          borderRadius: BorderRadius.circular(radius ?? 12),
          border: Border.all(color: borderColor ?? Colors.transparent),
          shape: shape,
        ),
        clipBehavior: clipBehavior ?? Clip.hardEdge,
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          minWidth: minWidth ?? 0,
          maxHeight: maxHeight ?? double.infinity,
          minHeight: minHeight ?? 0,
        ),
        child: child?? Text(title??"",style: titleStyle?.copyWith(
        color: monochromatic ? color : titleColor ?? Colors.black
        )?? TextStyle(color: monochromatic ? color : titleColor ?? Colors.black)),
      ),
    );
  }
}
