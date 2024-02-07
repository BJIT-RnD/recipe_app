import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  Test({super.key});

  var dropdownValue = "one".obs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => DropdownButton<String>(
          value: dropdownValue.value,
          icon: const Icon(Icons.menu),
          underline: Container(
            height: 2,
            color: Colors.purple,
          ),
          onChanged: (value) {
            dropdownValue(value);
          },
          items: const [
            DropdownMenuItem<String>(
              value: "one",
              child: Text("One"),
            ),
            DropdownMenuItem<String>(
              value: "two",
              child: Text("Two"),
            ),
            DropdownMenuItem<String>(
              value: "three",
              child: Text("Three"),
            ),
          ],
        ),
      ),
    );
  }
}
