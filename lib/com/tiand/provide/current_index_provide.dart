import 'package:flutter/material.dart';

//页面跳转provide
class CurrentIndexProvide with ChangeNotifier{
  int currentIndex = 0;

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

}