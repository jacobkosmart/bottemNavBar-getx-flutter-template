import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardController extends GetxController {
  int tabIndex = 0;
  int currentIndex = 0;
  Color inActiveColor = Colors.grey;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
