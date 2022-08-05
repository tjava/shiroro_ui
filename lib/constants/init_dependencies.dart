import 'package:get/get.dart';
import 'package:shiroro_ui/controllers/edit_table_controller.dart';
import 'package:shiroro_ui/controllers/home_controller.dart';
import 'package:shiroro_ui/controllers/login_controller.dart';
import 'package:shiroro_ui/controllers/register_controller.dart';

class InitDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => EditTableController());
  }
}
