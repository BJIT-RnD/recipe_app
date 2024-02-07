import 'package:flutter/material.dart';
import 'package:recipes/bindings/all_bindings.dart';
import 'package:recipes/view/root_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipes App',
      initialBinding: AllBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RootView(),
    );
  }
}
