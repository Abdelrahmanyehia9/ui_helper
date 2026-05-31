import 'package:flutter/material.dart';
import 'package:ui_helper_kit/enums/thumb_type.dart';

class OnBoardingItem {
  final Object image;
  final String title;
  final ThumbType type;
  final String description;

  const OnBoardingItem._({
    required this.image,
    required this.title,
    required this.description,
    required this.type,
  });

  factory OnBoardingItem.svg({
    required String svgPath,
    required String title,
    required String description,
  }) => OnBoardingItem._(
    image: svgPath,
    title: title,
    description: description,
    type: ThumbType.svg,
  );

  factory OnBoardingItem.image({
    required String imagePath,
    required String title,
    required String description,
  }) => OnBoardingItem._(
    image: imagePath,
    title: title,
    description: description,
    type: ThumbType.image,
  );

  factory OnBoardingItem.iconData({
    required Widget icon,
    required String title,
    required String description,
  }) => OnBoardingItem._(
    image: icon,
    title: title,
    description: description,
    type: ThumbType.iconData,
  );

  factory OnBoardingItem.other({
    required Widget child,
    required String title,
    required String description,
  }) => OnBoardingItem._(
    image: child,
    title: title,
    description: description,
    type: ThumbType.other,
  );
}

class OnBoardingSliderData {
  final int currentIndex;
  final int total;

  const OnBoardingSliderData({required this.currentIndex, required this.total});
}

class OnBoardingStyle {
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? radius, spacing;
  final Size? imageSize;
  final bool showDots;

  OnBoardingStyle({
    this.titleStyle,
    this.descriptionStyle,
    this.radius,
    this.spacing,
    this.imageSize,
    this.showDots = true,
  });
}
