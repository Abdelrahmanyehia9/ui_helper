import 'package:flutter/material.dart';
import 'package:ui_helper_kit/extensions/colors.dart';
import 'package:ui_helper_kit/extensions/context.dart';

class UISliderDots extends StatelessWidget {
  final int total;
  final int currentIndex;
  final Color? selectedColor ;
  final Color? unSelectedColor;
  final EdgeInsets? margin;
  final double?  activeWidth , width, height , radius;
  final Duration animationDuration;
  const UISliderDots({super.key,this.selectedColor,
    this.margin,
    this.activeWidth,
    this.width,
    this.height,
    this.animationDuration = const Duration(milliseconds: 400),
    this.radius,
    this.unSelectedColor ,required this.total, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
            (index) => AnimatedContainer(
          duration: animationDuration,
          margin: margin ?? EdgeInsets.symmetric(horizontal: 2),
          width: currentIndex == index ? activeWidth ??8 : width??4,
          height:height ??8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 4),
            color: currentIndex == index
                ?selectedColor ?? context.primary
                :unSelectedColor ??  context.primary.veryLight,
          ),
        ),
      ),
    );
  }
}