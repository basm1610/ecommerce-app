import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);
  postData(String email,String password) async {
    var response = await crud.postData(AppLink.rePassword, {
      "email" : email ,
      "password":password
    });
    return response.fold((l) => l, (r) => r);
  }
}