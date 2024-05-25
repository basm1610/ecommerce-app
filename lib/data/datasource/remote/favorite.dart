import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String usersId,String itemsId) async {
    var response = await crud.postData(AppLink.addFavorite, {
      "usersid" :usersId,
      "itemsid" :itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteFavorite(String usersId,String itemsId) async {
    var response = await crud.postData(AppLink.deleteFavorite, {
      "usersid" :usersId,
      "itemsid" :itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
}