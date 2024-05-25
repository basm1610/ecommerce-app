import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/controller/auth/sginup_controller.dart';
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.lazyPut(() => LoginControllerImp(),fenix: true);
  }

}