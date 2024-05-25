import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  myFavoriteData(String usersId) async {
    var response = await crud.postData(AppLink.myFavorite, {
      "id" :usersId,

    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteMyFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}