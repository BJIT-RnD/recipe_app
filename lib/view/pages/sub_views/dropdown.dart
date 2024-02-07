import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view_model/add_view_model.dart';

class Dropdown extends StatelessWidget {
  final AddViewModel viewModel;
  Dropdown({super.key, required this.viewModel});

  final List<String> list = ["apple", "biscuit", "cake"];

  final selectedItem = FoodCategory.breakfast.obs;

  void changeValue(value) {
    switch (value) {
      case "Breakfast":
        selectedItem(FoodCategory.breakfast);
        break;
      case "Lunch":
        selectedItem(FoodCategory.lunch);
        break;
      case "Drinks":
        selectedItem(FoodCategory.drinks);
        break;
      default:
        selectedItem(FoodCategory.breakfast);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 0, 8),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: DropdownButton<String>(
                onChanged: (value) {
                  changeValue(value);
                },
                items: const [
                  DropdownMenuItem(
                    value: "Breakfast",
                    child: Text("Breakfast"),
                  ),
                  DropdownMenuItem(
                    value: "Lunch",
                    child: Text("Lunch"),
                  ),
                  DropdownMenuItem(
                    value: "Drinks",
                    child: Text("Drinks"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
