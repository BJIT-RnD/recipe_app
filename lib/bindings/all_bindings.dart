import 'package:recipes/view_model/add_view_model.dart';
import 'package:recipes/view_model/favorite_view_model.dart';
import 'package:recipes/view_model/home_view_model.dart';
import 'package:recipes/view_model/root_view_model.dart';
import 'package:get/get.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootViewModel());
    Get.lazyPut(() => AddViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => FavoriteViewModel());
  }
}
