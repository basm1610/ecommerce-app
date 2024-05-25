import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class OrdersArchivedData {
  Crud crud;

  OrdersArchivedData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersArchived, {"id":usersid});
    return response.fold((l) => l, (r) => r);
  }

}