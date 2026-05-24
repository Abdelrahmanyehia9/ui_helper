import 'package:flutter/material.dart';


class UIAppbar extends AppBar {
  UIAppbar({
    super.key,
    Widget? leading,
    Object? title,
    bool showLeading = true,
    double titleTopPadding = 6,
    super.scrolledUnderElevation = 0,
    super.actionsPadding = const EdgeInsetsDirectional.only(top: 12, end: 16),
    super.actions,
    super.titleTextStyle,
    super.backgroundColor,
    super.bottomOpacity,
    super.elevation,
    super.surfaceTintColor,
    super.titleSpacing,
    super.actionsIconTheme,
    super.animateColor,
    super.toolbarTextStyle,
    super.bottom,
    super.flexibleSpace, super.clipBehavior, super.primary, super.shadowColor, super.systemOverlayStyle,
    super.shape, super.toolbarOpacity, super.automaticallyImplyLeading,  super.automaticallyImplyActions, super.foregroundColor, super.iconTheme,
    super.centerTitle =true
  }) : assert(
  title == null || title is String || title is Widget,
  'title must be a String or Widget',
  ),
        super(
        title: title == null
            ? null
            : Padding(
          padding: EdgeInsets.only(top: titleTopPadding),
          child: title is String
              ? Text(title,textAlign: TextAlign.center ,style: titleTextStyle )
              : title as Widget,
        ),
      );

}
