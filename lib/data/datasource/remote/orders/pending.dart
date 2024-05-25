import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class PendingData {
  Crud crud;

  PendingData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersPending, {"id":usersid});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String ordersId) async {
    var response = await crud.postData(AppLink.ordersDelete, {"id":ordersId});
    return response.fold((l) => l, (r) => r);
  }
}