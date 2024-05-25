import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class VerifyCodeSignUp {
  Crud crud;
  VerifyCodeSignUp(this.crud);
  postdata(String email ,String verifyCode ) async {
    var response = await crud.postData(AppLink.verifyCode, {
      "email" : email ,
      "verifycode" : verifyCode  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}