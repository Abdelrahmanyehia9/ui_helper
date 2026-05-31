import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_helper_kit/enums/thumb_type.dart';
import 'package:ui_helper_kit/extensions/context.dart';
import 'package:ui_helper_kit/models/on_boarding_data.dart';
import 'package:ui_helper_kit/widgets/ui_slider_dots.dart';
import 'ui_text.dart';




class UiOnBoardingItem extends StatelessWidget {
  final OnBoardingItem item;
  final double? spacing , imageHeight, imageWidth, radius;
  final BoxFit? fit;
  final TextStyle? titleStyle , descriptionStyle;
  final OnBoardingSliderData? sliderData;

  const UiOnBoardingItem({super.key,this.titleStyle ,this.descriptionStyle  ,this.radius ,this.spacing, this.fit, this.imageHeight, this.imageWidth, required this.item, this.sliderData});

  @override
  Widget build(BuildContext context) {
    final spacing = this.spacing ?? 12 ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: spacing ,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 0),
          child: _buildImage(context.height),
        ),
        if(sliderData!=null)
        /// dots
        UISliderDots(total: sliderData!.total, currentIndex: sliderData!.currentIndex),
        SizedBox(
          height: spacing,
        ),
        /// title
        UIText(
          item.title,
          overflow: TextOverflow.visible,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),

        /// description
        UIText(
          item.description,
          overflow: TextOverflow.visible,
          style: descriptionStyle ?? TextStyle(
            color: Colors.grey
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImage(double pageHeight) {
    if (item.type == ThumbType.svg) {
      return SvgPicture.asset(
        item.image as String,
        fit: fit ?? BoxFit.cover,
        height:imageHeight?? pageHeight * .257,
        width:imageWidth ??  double.infinity,
      );

    }
    if(item.type == ThumbType.image){
       return Image.asset(item.image as String ,
       fit: fit,
         height:imageHeight?? pageHeight * .257,
         width:imageWidth ??  double.infinity,
       );
    }
    return SizedBox(
      height: imageHeight ?? pageHeight * .257,
      width: imageWidth ?? double.infinity,
      child:  item.image as Widget,
    );
  }
}
