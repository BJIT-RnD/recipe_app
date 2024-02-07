import 'package:flutter/material.dart';
import 'package:recipes/view_model/root_view_model.dart';
import 'package:get/get.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    final rootViewModel = Get.find<RootViewModel>();
    // final rootViewModel = Get.put(RootViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root View'),
      ),
      body: Obx(
        () => rootViewModel.pages[rootViewModel.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          selectedIndex: rootViewModel.selectedIndex.value,
          onDestinationSelected: rootViewModel.changeIndex,
          indicatorColor: const Color.fromRGBO(0, 180, 191, 0.25),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark),
              label: "Category",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            NavigationDestination(
              icon: Icon(Icons.add),
              label: "Add",
            ),
          ],
        ),
      ),
    );
  }
}
