import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_bottom_nav_sample/pages/internal_storage/counter/counter_controller.dart';

class AddCounter extends GetView<CounterController> {
  const AddCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: controller.isCategoriPageOpen.value
            ? GestureDetector(
                onTap: controller.back,
                child: const Icon(Icons.arrow_back_ios),
              )
            : Container(),
        title: controller.isCategoriPageOpen.value
            ? Text('Counter')
            : Text('Shared_preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${controller.counter.value}",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Divider(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Increase"),
              onPressed: () {
                controller.increaseCounter();
                // shared_preferences 에 저장
                controller.setData(controller.counter.value);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
