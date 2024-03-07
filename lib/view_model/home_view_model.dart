import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view/pages/home_view.dart';

class HomeViewModel extends GetxController {
  var data = RecipeData.filteredData.obs;

  var searchController = TextEditingController();

  var isSelected = [true, false, false].obs;
  var selectedIndex = 0.obs;

  var displayItem = [
    const TypeOneView(),
    const TypeTwoView(),
    const TypeThreeView(),
  ].obs;

  // void setData(recipeData) {
  //   data(recipeData);
  // }
}
