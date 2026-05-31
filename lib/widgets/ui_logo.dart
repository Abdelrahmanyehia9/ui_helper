import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../enums/thumb_type.dart';



class UILogo extends StatelessWidget {
  final double? size;
  final Color? color;
  final ThumbType type ;
  final dynamic path ;
  const UILogo._({required this.path ,this.size , this.color , required this.type});


  factory UILogo.svg({required String path,  double? size , Color? color}) => UILogo._(size: size, color: color, type: ThumbType.svg, path:  path ,);
  factory UILogo.image({required String path,  double? size }) => UILogo._(size: size, type: ThumbType.image , path: path);
  factory UILogo.other({required Widget child ,  double? size , Color? color}) => UILogo._(size: size, color: color, type: ThumbType.other, path: child);
  factory UILogo.iconData({required IconData icon,  double? size , Color? color}) => UILogo._(size: size, color: color, type: ThumbType.iconData, path: icon);

  @override
  Widget build(BuildContext context) {
    late Widget logo ;
   switch (type){
     case ThumbType.image :
     logo = Image.asset(path as String, width: size, height: size);
     case ThumbType.iconData:
     logo = Icon(path as IconData, size: size, color: color);
     case ThumbType.svg:
     logo = SvgPicture.asset(path as String, width: size, height: size, colorFilter: color == null ? null:  ColorFilter.mode(color!, BlendMode.srcIn));
     case ThumbType.other:
     logo = path as Widget;
   }
   return Center(child:logo) ;
  }
}
