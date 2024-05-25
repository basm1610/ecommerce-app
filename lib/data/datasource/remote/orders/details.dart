import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class OrderDetailsData {
  Crud crud;

  OrderDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersDetails, {
      "id" :id
    });
    return response.fold((l) => l, (r) => r);
  }
}