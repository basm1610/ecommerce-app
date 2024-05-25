import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/items.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();

  changeCat(int val, String valCat);

  getItems(String categoryId);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectCat;
  String? categoryId;
  String? lang;

  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();


  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectCat = Get.arguments['selectCat'];
    categoryId = Get.arguments['categoryId'];
    getItems(categoryId!);
    lang = myServices.sharedPreferences.getString("lang");

  }

  @override
  changeCat(val, valCat) {
    selectCat = val;
    categoryId = valCat;
    getItems(categoryId!);
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId,myServices.sharedPreferences.getString("id")!);
    print("************items*******************");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status']== "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        print("no data");
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRouts.productDetails,arguments: {
      "itemsModel":itemsModel,
    });
  }
}
