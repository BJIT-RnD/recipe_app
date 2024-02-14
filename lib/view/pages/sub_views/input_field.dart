import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final ValueSetter doChange;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.title,
    required this.doChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: TextField(
            controller: controller,
            cursorColor: Colors.black45,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.cyan,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: doChange,
          ),
        ),
      ],
    );
  }
}
