import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../enums/logo_type.dart';



class UILogo extends StatelessWidget {
  final double? size;
  final Color? color;
  final LogoType type ;
  final dynamic path ;
  const UILogo._({required this.path ,this.size , this.color , required this.type});


  factory UILogo.svg({required String path,  double? size , Color? color}) => UILogo._(size: size, color: color, type: LogoType.svg, path:  path ,);
  factory UILogo.image({required String path,  double? size }) => UILogo._(size: size, type: LogoType.image , path: path);
  factory UILogo.other({required Widget child ,  double? size , Color? color}) => UILogo._(size: size, color: color, type: LogoType.other, path: child);
  factory UILogo.iconData({required IconData icon,  double? size , Color? color}) => UILogo._(size: size, color: color, type: LogoType.iconData, path: icon);

  @override
  Widget build(BuildContext context) {
    late Widget logo ;
   switch (type){
     case LogoType.image :
     logo = Image.asset(path as String, width: size, height: size);
     case LogoType.iconData:
     logo = Icon(path as IconData, size: size, color: color);
     case LogoType.svg:
     logo = SvgPicture.asset(path as String, width: size, height: size, colorFilter: color == null ? null:  ColorFilter.mode(color!, BlendMode.srcIn));
     case LogoType.other:
     logo = path as Widget;
   }
   return Center(child:logo) ;
  }
}
