import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{
  String? isPaymentMethod;
  String? isDeliveryType;
  String? isShippingAddress;
  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = CheckoutData(Get.find());
  MyServices myServices = Get.find();
  late String idCoupon;
  late String orderPrice;
  late String discountCoupon;

  paymentMethod(String val){
    isPaymentMethod = val;
    update();
  }
  deliveryType(String val){
    isDeliveryType = val;
    update();
  }
  shippingAddress(String val){
    isShippingAddress = val;
    update();
  }
  getData() async {
    if(isPaymentMethod == null) return Get.snackbar("alert", "Please Select The Payment Method");
    if(isDeliveryType == null) return Get.snackbar("alert", "Please Select The Delivery Type");
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid" : myServices.sharedPreferences.getString("id"),
      "addressid": "0",
      "ordertype" : isDeliveryType.toString(),
      "pricedelivery" : "20",
      "orderprice" : orderPrice,
      "couponid" : idCoupon,
      "paymentmethod" : isPaymentMethod.toString(),
      "paymentmethod" : isPaymentMethod.toString(),
      "coupondiscount" : discountCoupon.toString(),
    };
    var response = await checkoutData.getData(data);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        print("success");
        Get.offNamed(AppRouts.home);
        Get.snackbar("Success", "The orders is Successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Please Try Again!!");

      }
      // End
    }
    update();
  }
  @override
  void onInit() {
    idCoupon = Get.arguments['idCoupon'];
    orderPrice = Get.arguments['orderPrice'];
    discountCoupon = Get.arguments['discountCoupon'].toString();
    print("$idCoupon-------------------------");
    super.onInit();
  }
}