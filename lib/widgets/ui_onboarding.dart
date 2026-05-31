import 'package:flutter/material.dart';
import 'package:ui_helper_kit/models/on_boarding_data.dart';
import 'package:ui_helper_kit/widgets/ui_on_boarding_item.dart';

import '../controllers/onboarding_controller.dart';
class UiOnboarding extends StatelessWidget {
  final List<OnBoardingItem> onBoardingItems;
  final Widget Function(bool isLast)? header ;
  final Widget Function(bool isLast)? footer ;
  final UIOnBoardingController controller ;
  final OnBoardingStyle? style ;
  final Widget Function(OnBoardingItem, int, bool,)? customBuilder ;
  const UiOnboarding({super.key, this.style ,required this.controller,this.customBuilder ,required this.onBoardingItems, this.header, this.footer});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: controller.currentIndex,
      builder: (context, value, child) {
        bool isLast = value == onBoardingItems.length - 1;
        return Column(
          children: [
            ?header?.call(isLast) ,
            child!,
            ?footer?.call(isLast) ,
          ],
        );
      },
      child: Expanded(
        child: PageView.builder(
          controller: controller.page,
          itemCount: onBoardingItems.length,
          onPageChanged: (i) => controller.currentIndex.value = i,
          itemBuilder: (_, i) {
            final item = onBoardingItems[i];
            if(customBuilder != null) {
              return customBuilder!(item, i, i == onBoardingItems.length - 1);
            }
            return UiOnBoardingItem(
            item: onBoardingItems[i],
            titleStyle: style?.titleStyle,
            descriptionStyle: style?.descriptionStyle,
            radius: style?.radius,
            spacing: style?.spacing,
            imageWidth: style?.imageSize?.width,
            imageHeight: style?.imageSize?.height,
            sliderData:style?.showDots == false ? null : OnBoardingSliderData(
              currentIndex: i,
              total: onBoardingItems.length,
            ),
          );
          },
        ),
      ),
    );
  }
}
