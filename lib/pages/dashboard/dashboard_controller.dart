import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  int tabIndex = 0;
  int currentIndex = 0;
  Color inActiveColor = Colors.grey;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  // Navigator key 생성
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> onWillPop() async {
    // maypop : pop 할께 있으면 pop을 하고, 아니면, app 을 종료 시키는것
    // pop 할께 있으면 true 인데, true 이면 app 이 종료가 되기 때문에 false 로 바꿔 줘야 되기 때문에 await 앞에 ! 을 넣어 줌
    return !await navigatorKey.currentState!.maybePop();
  }
}
