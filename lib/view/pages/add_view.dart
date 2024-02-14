import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/view/pages/sub_views/dropdown.dart';
import 'package:recipes/view/pages/sub_views/input_field.dart';
import 'package:recipes/view_model/add_view_model.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    final addViewModel = Get.find<AddViewModel>();
    void buttonPressed() {
      addViewModel.onSubmit();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              title: "Name",
              doChange: addViewModel.setName,
              controller: addViewModel.nameController,
            ),
            InputField(
              title: "Calories",
              doChange: addViewModel.setCalories,
              controller: addViewModel.caloriesController,
            ),
            InputField(
              title: "Time to cook",
              doChange: addViewModel.setMakingTime,
              controller: addViewModel.makingTimeController,
            ),
            Dropdown(viewModel: addViewModel),
            Center(
              child: SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: buttonPressed,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text("Save"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
