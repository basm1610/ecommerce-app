import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: ClipOval(

        child: Image.asset(
          AppImageAsset.logo,

        ),
      ),
      radius: 55,
      backgroundColor: AppColor.primaryColor,


    );
  }
}
