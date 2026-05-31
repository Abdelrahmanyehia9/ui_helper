import 'package:flutter/material.dart';

class UIOnBoardingController{
  final PageController page = PageController();
  final currentIndex = ValueNotifier(0);

  void next() {
    page.animateToPage(
      currentIndex.value + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }
  void prev(){
    page.animateToPage(
      currentIndex.value - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }
  void dispose() {
    page.dispose();
    currentIndex.dispose();
  }
}
