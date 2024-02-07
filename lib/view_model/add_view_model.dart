import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';

class AddViewModel extends GetxController {
  var name = "".obs;
  var calories = "0".obs;
  var makingTime = "0".obs;
  var category = (FoodCategory.breakfast).obs;

  void setName(val) => name(val);
  void setCalories(val) => calories(val);
  void setMakingTime(val) => makingTime(val);

  void onSubmit() {
    if (name.value != "" && calories.value != "" && makingTime.value != "") {
      debugPrint("name: ${name.toString()}");
      debugPrint("calories: ${calories.toString()}");
      debugPrint("time: ${makingTime.toString()}");
      Get.snackbar(
        "Success",
        "Your data added successfully.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        "Error",
        "Every field must be filled up.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber,
        duration: const Duration(seconds: 1),
      );
    }
  }
}
