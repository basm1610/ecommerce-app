import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword(String verifyCode);
}
class VerifyCodeControllerImp extends   VerifyCodeController{
  String? email;

  StatusRequest? statusRequest =StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  @override
  void onInit() {
    email =Get.arguments['email'];

    super.onInit();
  }
  @override
  checkCode() {}
  @override
  goToResetPassword(verifyCode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRouts.resetPassword,arguments: {
          "email":email
        });
        // Get.offNamed(AppRouts.login);
      } else {
        Get.defaultDialog(title: "ُWarning" , middleText: "Verify Code Not Correct") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}
