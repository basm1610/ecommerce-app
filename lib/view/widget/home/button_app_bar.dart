import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class ButtonAppBarWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  final bool active;
  const ButtonAppBarWidget(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 10,
      onPressed: onPressed,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          Text(
            text,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey2),
          ),
        ],
      ),
    );
  }
}
