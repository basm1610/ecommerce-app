import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:get/get.dart';

DatabaseTranslation(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
