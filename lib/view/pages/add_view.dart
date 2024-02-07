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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(title: "Name", doChange: addViewModel.setName),
            InputField(title: "Calories", doChange: addViewModel.setCalories),
            InputField(
                title: "Time to cook", doChange: addViewModel.setMakingTime),
            Dropdown(viewModel: addViewModel),
            Center(
              child: SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: addViewModel.onSubmit,
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
