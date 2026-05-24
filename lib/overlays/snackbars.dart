import 'package:flutter/material.dart';
import 'package:ui_helper/widgets/ui_gap.dart';

class SnackBars {
  const SnackBars._();
  static void custom(
      String message, {
        Color? backgroundColor,
        Color borderColor = Colors.transparent,
        String? title ,
        IconData? icon,
        LinearGradient? gradient,
        TextStyle ? titleStyle ,
        TextStyle ? messageStyle ,
        EdgeInsets? padding,
        double elevation = 0,
        required BuildContext context ,
        Duration duration = const Duration(milliseconds: 1200),
      })
  {
    final snackBar = SnackBar(
      elevation: elevation,
      padding: padding?? EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: AnimatedContainer(
        duration: duration,
        curve: Curves.bounceOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white),
              UIGap.small(),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(title != null)
                    Text(title, style:titleStyle),
                  Text(message,maxLines: 2 ,style: messageStyle),
                ],
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
      ),
      duration: duration,
      behavior: SnackBarBehavior.fixed,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
      snackBarAnimationStyle: const AnimationStyle(
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceOut,
        duration: Duration(milliseconds: 600),
      ),
    );
  }
}
