import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view_model/home_view_model.dart';

class AddViewModel extends GetxController {
  var nameController = TextEditingController();
  var caloriesController = TextEditingController();
  var makingTimeController = TextEditingController();

  var name = "".obs;
  var calories = "0".obs;
  var makingTime = "0".obs;
  var category = FoodCategory.breakfast.obs;
  var error = {
    "title": "",
    "message": "",
    "bgColor": Colors.accents,
    "textColor": Colors.white,
  }.obs;

  void setName(val) => name(val);
  void setCalories(val) => calories(val);
  void setMakingTime(val) => makingTime(val);
  void setCategory(val) => category(val);

  void onSubmit() {
    var cal = 0;
    var mTime = 0;
    if (name.value != "" && calories.value != "" && makingTime.value != "") {
      try {
        cal = int.parse(calories.value);
        try {
          mTime = int.parse(makingTime.value);
          RecipeData.data.add(
            Recipe(
                name: name.value,
                calories: cal,
                makingTime: mTime,
                category: category.value),
          );
          // RecipeData.filteredData.value = RecipeData.data;
          // var hvm = Get.find<HomeViewModel>();
          // hvm.searchController.clear;
          error({
            "title": "Success",
            "message": "Your data added successfully",
            "bgColor": Colors.green,
            "textColor": Colors.white,
          });
          setName("");
          setCalories("");
          setMakingTime("");
          setCategory(FoodCategory.breakfast);
          nameController.clear();
          caloriesController.clear();
          makingTimeController.clear();
        } catch (e) {
          error({
            "title": "Error",
            "message": "Time must be integer value",
            "bgColor": Colors.red,
            "textColor": Colors.white,
          });
        }
      } catch (e) {
        error({
          "title": "Error",
          "message": "Calories must be integer value",
          "bgColor": Colors.red,
          "textColor": Colors.white,
        });
      }
    } else {
      error({
        "title": "Error",
        "message": "Every field must be filled up.",
        "bgColor": Colors.amber,
        "textColor": Colors.black,
      });
    }

    Get.snackbar(
      error["title"].toString(),
      error["message"].toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: error["bgColor"] as Color,
      colorText: error["textColor"] as Color,
      duration: const Duration(seconds: 1),
    );
  }
}
