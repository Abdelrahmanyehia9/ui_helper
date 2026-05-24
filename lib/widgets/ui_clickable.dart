import 'package:flutter/material.dart';

class UIClickable extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap, onLongPress, onDoubleTap;
  final bool enabled;
  const UIClickable({required this.child,this.enabled =true , this.onTap,this.onDoubleTap, this.onLongPress, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enabled? onTap : null,
      onLongPress: enabled ?  onLongPress: null,
      onDoubleTap:enabled?  onDoubleTap: null,
      child: child
    );
  }
}
