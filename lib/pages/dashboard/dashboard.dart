import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bottom_nav_sample/model/custom_animated_bottom_bar.dart';
import 'package:getx_bottom_nav_sample/pages/dashboard/dashboard_controller.dart';
import 'package:getx_bottom_nav_sample/pages/home/home_page.dart';
import 'package:getx_bottom_nav_sample/pages/internal_storage/internal_storage_page.dart';
import 'package:getx_bottom_nav_sample/pages/settings/settings_page.dart';

class MyDashBoard extends GetView<DashboardController> {
  MyDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 뒤로가기 버튼을 누르게 되면 onwillpop 에 event 가 잡히게 되는것
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomePage(),
                  // NestingRouting 을 위해서 GetX 가 아닌 Navigatior 로 넘김
                  Navigator(
                    key: controller.navigatorKey,
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => InternalStorage(),
                      );
                    },
                  ),
                  SettingsPage(),
                ],
              ),
            ),
            bottomNavigationBar: CustomAnimatedBottomBar(
              containerHeight: 70,
              backgroundColor: Colors.white,
              selectedIndex: controller.tabIndex,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              onItemSelected: controller.changeTabIndex,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Home'),
                  activeColor: Colors.green,
                  inactiveColor: controller.inActiveColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.storage_sharp),
                  title: Text('Internal'),
                  activeColor: Colors.purpleAccent,
                  inactiveColor: controller.inActiveColor,
                  textAlign: TextAlign.center,
                ),
                // BottomNavyBarItem(
                //   icon: Icon(Icons.sd_storage),
                //   title: Text(
                //     'External',
                //   ),
                //   activeColor: Colors.pink,
                //   inactiveColor: controller.inActiveColor,
                //   textAlign: TextAlign.center,
                // ),
                BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.blue,
                  inactiveColor: controller.inActiveColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
