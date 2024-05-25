import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersId,String itemsId) async {
    var response = await crud.postData(AppLink.addCart, {
      "usersid" :usersId,
      "itemsid" :itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteCart(String usersId,String itemsId) async {
    var response = await crud.postData(AppLink.deleteCart, {
      "usersid" :usersId,
      "itemsid" :itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
  countItems(String usersId,String itemsId) async {
    var response = await crud.postData(AppLink.countItems, {
      "usersid" :usersId,
      "itemsid" :itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
  cartView(String usersId) async {
    var response = await crud.postData(AppLink.viewCart, {
      "usersid" :usersId,
    });
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponName" :couponName,
    });
    return response.fold((l) => l, (r) => r);
  }

}