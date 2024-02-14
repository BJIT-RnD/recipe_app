import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  Test({super.key});

  var selectedIndex = 0.obs;
  var isSelected = [true, false].obs;
  var display = [
    const Text("Grid view"),
    const Text("List view"),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Obx(
            () => ToggleButtons(
              isSelected: isSelected,
              onPressed: (index) {
                selectedIndex.value = index;
                for (var i = 0; i < isSelected.length; i++) {
                  if (index == i) {
                    isSelected[i] = true;
                  } else {
                    isSelected[i] = false;
                  }
                }
              },
              children: const [
                Icon(Icons.grid_view),
                Icon(Icons.list),
              ],
            ),
          ),
          Obx(
            () => display[selectedIndex.value],
          ),
        ],
      ),
    );
  }
}
