import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/model/dummy_data.dart';
import 'package:recipes/view_model/add_view_model.dart';

class Dropdown extends StatelessWidget {
  final AddViewModel viewModel;
  const Dropdown({super.key, required this.viewModel});

  void changeValue(value) {
    switch (value) {
      case "breakfast":
        viewModel.setCategory(FoodCategory.breakfast);
        break;
      case "lunch":
        viewModel.setCategory(FoodCategory.lunch);
        break;
      case "drinks":
        viewModel.setCategory(FoodCategory.drinks);
        break;
      case "pastas":
        viewModel.setCategory(FoodCategory.pastas);
        break;
      case "salads":
        viewModel.setCategory(FoodCategory.salads);
        break;
      case "desserts":
        viewModel.setCategory(FoodCategory.desserts);
        break;
      case "soups":
        viewModel.setCategory(FoodCategory.soups);
        break;
      default:
        viewModel.setCategory(FoodCategory.breakfast);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2, color: Colors.grey),
                  right: BorderSide(width: 2, color: Colors.grey),
                  bottom: BorderSide(width: 2, color: Colors.grey),
                  left: BorderSide(width: 2, color: Colors.grey),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: viewModel.category.value.toString().split('.').last,
                  isExpanded: true,
                  padding: const EdgeInsets.all(8.0),
                  onChanged: (value) {
                    changeValue(value);
                  },
                  items: FoodCategory.values.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.toString().split('.').last,
                      child: Text(item.toString().split('.').last),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
