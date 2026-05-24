import 'package:flutter/material.dart';

class UIGap extends StatelessWidget {
  final double size;
  const UIGap(this.size, {super.key});
  factory UIGap.medium() => const UIGap(16);
  factory UIGap.small() => const UIGap(8);
  factory UIGap.extraSmall() => const UIGap(4);
  factory UIGap.large() => const UIGap(24);
  factory UIGap.extraLarge() => const UIGap(32);
  factory UIGap.huge() => const UIGap(40);
  factory UIGap.tiny() => const UIGap(2);



  @override
  Widget build(BuildContext context) {
    Axis? axis;
    context.visitAncestorElements((element) {
      final widget = element.widget;
      if (widget is Flex) {
        axis = widget.direction;
        return false;
      }
      return true;
    });
    if (axis == Axis.horizontal) {
      return SizedBox(width: size);
    } else {
      return SizedBox(height: size);
    }
  }
}