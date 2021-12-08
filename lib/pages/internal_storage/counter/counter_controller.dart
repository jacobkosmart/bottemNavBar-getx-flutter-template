import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getx_bottom_nav_sample/pages/dashboard/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController extends GetxController {
  static CounterController get to => Get.find();
  RxInt counter = 0.obs;
  RxBool isCategoriPageOpen = false.obs;

  @override
  void onInit() {
    // controller 시작 할때 shared_preferences 에서 저장된 value 값 가져 오기
    loadData();
    super.onInit();
  }

  void increaseCounter() {
    counter.value++;
  }

  void decreseCount() {
    counter.value--;
  }

  // 데이터를 저장하는 함수 shared_preferences
  void setData(int value) async {
    // key 값 만들기
    String key = "count";
    // shared_preferences instance 생성
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  // 데이터 가져오는 함수
  void loadData() async {
    String key = "count";
    SharedPreferences pref = await SharedPreferences.getInstance();
    // key 값이 count 인 value 값 instacne 에서 가져오기
    int? value = pref.getInt(key);
    // value 의 값이 없으면 초기 값 0으로 설정하고, 값이 있으면 저장된 값이 counter 가 되게 함
    if (value == null) {
      counter = 0.obs;
    } else {
      counter.value = value;
    }
  }

  void setCategoryPage(bool ck) {
    isCategoriPageOpen(ck);
  }

  void back() {
    setCategoryPage(false);
    DashboardController.to.onWillPop();
  }
}
