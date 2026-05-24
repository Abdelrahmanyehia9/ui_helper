import 'package:flutter/material.dart';

extension SpaceExt on num{
  Widget get uiSpaceVr =>SizedBox(height: toDouble(),);
  Widget get uiSpaceHr =>SizedBox(width: toDouble(),);
}

