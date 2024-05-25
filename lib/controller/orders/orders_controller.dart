import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/pending.dart';
import 'package:ecommerce_app/data/model/coupon_model.dart';
import 'package:ecommerce_app/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  PendingData pendingData = PendingData(Get.find());
  MyServices myServices = Get.find();
  int? coupon;
  CouponModel? couponModel;
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

  String printOrderCoupon(String val){
    if(val == "0"){
      return "No Coupon";
    }
    else{
      return "You are using the coupon";
    }
  }

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "The order is pending";
    } else if (val == "1") {
      return "The order is ready";
    } else if (val == "2") {
      return "The order is on the way";
    } else {
      return "Archived";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pendingData.getData(myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List lisData = response['data'];

        data.addAll(lisData.map((e) => OrdersModel.fromJson(e)));
         print(OrdersModel().ordersCoupon);
      } else {
        statusRequest = StatusRequest.failure;
        print("no data");
      }
    }
    update();
  }

  deleteOrders(String ordersId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pendingData.deleteData(ordersId);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  refreshOrders(){
    getOrders();
  }
  @override
  void onInit() {
    // print("++++++++++++++++++ $coupon ++++++++++++++++++");
    getOrders();
    super.onInit();
  }
}
