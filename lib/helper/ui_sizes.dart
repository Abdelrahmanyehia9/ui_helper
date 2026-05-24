import 'package:flutter/material.dart';
class UISizesInit extends StatelessWidget {
 final Widget child;
 const UISizesInit({super.key, required this.child});

 @override
 Widget build(BuildContext context) {
  UISizes.init(context);
  return child;
 }
}

class UISizes {
 UISizes._();
 static late double _width;
 static late double _height;
 static late double _textScale;
 static void init(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  _width = size.width;
  _height = size.height;
  _textScale = MediaQuery.textScalerOf(context).scale(1);
 }
 static double _h(double v) => _height * (v / 100);
 static double _w(double v) => _width * (v / 100);
 static double _r(double v) => (_width + _height) / 2 * (v / 100);
 static double _sp(double v) => v * _textScale;

 // Heights
 static double get h1 => _h(1);
 static double get h2 => _h(2);
 static double get h3 => _h(3);
 static double get h4 => _h(4);
 static double get h5 => _h(5);
 static double get h6 => _h(6);
 static double get h7 => _h(7);
 static double get h8 => _h(8);
 static double get h9 => _h(9);
 static double get h10 => _h(10);
 static double get h11 => _h(11);
 static double get h12 => _h(12);
 static double get h14 => _h(14);
 static double get h16 => _h(16);
 static double get h18 => _h(18);
 static double get h20 => _h(20);
 static double get h22 => _h(22);
 static double get h24 => _h(24);
 static double get h26 => _h(26);
 static double get h28 => _h(28);
 static double get h30 => _h(30);
 static double get h32 => _h(32);
 static double get h36 => _h(36);
 static double get h40 => _h(40);
 static double get h44 => _h(44);
 static double get h48 => _h(48);
 static double get h52 => _h(52);
 static double get h56 => _h(56);
 static double get h60 => _h(60);
 static double get h64 => _h(64);
 static double get h70 => _h(70);
 static double get h72 => _h(72);
 static double get h80 => _h(80);
 static double get h88 => _h(88);
 static double get h96 => _h(96);
 static double get h100 => _h(100);
 static double get h128 => _h(128);
 static double get h144 => _h(144);
 static double get h160 => _h(160);
 static double get h192 => _h(192);
 static double get h200 => _h(200);
 static double get h256 => _h(256);
 static double get h300 => _h(300);
 static double get h320 => _h(320);
 static double get h400 => _h(400);
 static double get h512 => _h(512);

 // Widths
 static double get w1 => _w(1);
 static double get w2 => _w(2);
 static double get w3 => _w(3);
 static double get w4 => _w(4);
 static double get w5 => _w(5);
 static double get w6 => _w(6);
 static double get w7 => _w(7);
 static double get w8 => _w(8);
 static double get w9 => _w(9);
 static double get w10 => _w(10);
 static double get w11 => _w(11);
 static double get w12 => _w(12);
 static double get w14 => _w(14);
 static double get w16 => _w(16);
 static double get w18 => _w(18);
 static double get w20 => _w(20);
 static double get w22 => _w(22);
 static double get w24 => _w(24);
 static double get w26 => _w(26);
 static double get w28 => _w(28);
 static double get w30 => _w(30);
 static double get w32 => _w(32);
 static double get w36 => _w(36);
 static double get w40 => _w(40);
 static double get w44 => _w(44);
 static double get w48 => _w(48);
 static double get w52 => _w(52);
 static double get w56 => _w(56);
 static double get w60 => _w(60);
 static double get w64 => _w(64);
 static double get w70 => _w(70);
 static double get w72 => _w(72);
 static double get w80 => _w(80);
 static double get w88 => _w(88);
 static double get w96 => _w(96);
 static double get w100 => _w(100);
 static double get w128 => _w(128);
 static double get w144 => _w(144);
 static double get w160 => _w(160);
 static double get w192 => _w(192);
 static double get w200 => _w(200);
 static double get w256 => _w(256);
 static double get w300 => _w(300);
 static double get w320 => _w(320);
 static double get w400 => _w(400);
 static double get w512 => _w(512);

 // Radius
 static double get r2 => _r(2);
 static double get r4 => _r(4);
 static double get r6 => _r(6);
 static double get r8 => _r(8);
 static double get r10 => _r(10);
 static double get r12 => _r(12);
 static double get r14 => _r(14);
 static double get r16 => _r(16);
 static double get r18 => _r(18);
 static double get r20 => _r(20);
 static double get r24 => _r(24);
 static double get r28 => _r(28);
 static double get r32 => _r(32);
 static double get r40 => _r(40);
 static double get r48 => _r(48);
 static double get r56 => _r(56);
 static double get r64 => _r(64);
 static double get r100 => _r(100);

 // Font Sizes
 static double get sp1 => _sp(1);
 static double get sp2 => _sp(2);
 static double get sp4 => _sp(4);
 static double get sp6 => _sp(6);
 static double get sp8 => _sp(8);
 static double get sp10 => _sp(10);
 static double get sp11 => _sp(11);
 static double get sp12 => _sp(12);
 static double get sp13 => _sp(13);
 static double get sp14 => _sp(14);
 static double get sp15 => _sp(15);
 static double get sp16 => _sp(16);
 static double get sp17 => _sp(17);
 static double get sp18 => _sp(18);
 static double get sp20 => _sp(20);
 static double get sp22 => _sp(22);
 static double get sp24 => _sp(24);
 static double get sp26 => _sp(26);
 static double get sp28 => _sp(28);
 static double get sp30 => _sp(30);
 static double get sp32 => _sp(32);
 static double get sp36 => _sp(36);
 static double get sp40 => _sp(40);
 static double get sp48 => _sp(48);
 static double get sp56 => _sp(56);
 static double get sp60 => _sp(60);
 static double get sp64 => _sp(64);
 static double get sp72 => _sp(72);
 static double get sp80 => _sp(80);
 static double get sp96 => _sp(96);
}

extension AppSizesExtension on num {
 double get h => UISizes._h(toDouble());
 double get w => UISizes._w(toDouble());
 double get r => UISizes._r(toDouble());
 double get sp =>UISizes._sp(toDouble());
}