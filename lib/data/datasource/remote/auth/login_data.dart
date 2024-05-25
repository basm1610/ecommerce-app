import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String password ,String email ) async {
    var response = await crud.postData(AppLink.linkLogin, {
      "password" : password  ,
      "email" : email ,
    });
    return response.fold((l) => l, (r) => r);
  }
}