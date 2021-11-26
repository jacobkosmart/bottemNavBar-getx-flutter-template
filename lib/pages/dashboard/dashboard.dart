import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bottom_nav_sample/model/custom_animated_bottom_bar.dart';
import 'package:getx_bottom_nav_sample/pages/add/add_page.dart';
import 'package:getx_bottom_nav_sample/pages/dashboard/dashboard_controller.dart';
import 'package:getx_bottom_nav_sample/pages/home/home_page.dart';
import 'package:getx_bottom_nav_sample/pages/messages/messages_page.dart';
import 'package:getx_bottom_nav_sample/pages/users/users_page.dart';

class MyDashBoard extends StatelessWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                UsersPage(),
                MessagesPage(),
                AddPage(),
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
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.purpleAccent,
                inactiveColor: controller.inActiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text(
                  'Messages ',
                ),
                activeColor: Colors.pink,
                inactiveColor: controller.inActiveColor,
                textAlign: TextAlign.center,
              ),
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
    );
  }
}
