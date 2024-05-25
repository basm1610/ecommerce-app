import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verfiycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  login();
  goToSuccessSignUp(String VerfiyCodeSignUp);
}
class VerifyCodeSignUpControllerImp extends   VerifyCodeSignUpController{
String? email;

VerifyCodeSignUp verifyCode = VerifyCodeSignUp(Get.find());
StatusRequest? statusRequest =StatusRequest.none;


  @override
  login() {}

  @override
  goToSuccessSignUp(VerfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCode.postdata(email!, VerfiyCodeSignUp);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRouts.successSignUp
        );
        // Get.offNamed(AppRouts.login);
      } else {
        Get.defaultDialog(title: "ُWarning" , middleText: "Verify Code Not Correct") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
@override
void onInit() {
  email =Get.arguments['email'];
  super.onInit();
}
}
