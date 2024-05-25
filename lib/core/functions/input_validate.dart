 import 'package:get/get.dart';

validInput (String val ,int min ,int max ,String type){
  final String tMin = "55".tr;
  final String tMax = "56".tr;

  if(val.isEmpty){
    return "51".tr;
  }
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "52".tr;
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "53".tr;
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "54".tr;
    }
  }
  if(val.length <min){
    return "$tMin$min";
  }
  if(val.length >max){
    return "$tMax$max";
  }


}