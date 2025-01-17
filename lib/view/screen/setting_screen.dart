
import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(
      children: [
        Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                  top: Get.width / 3.9,
                  child: Container(
                    padding:  EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: AssetImage(AppImageAsset.avater),
                    ),
                  )),
            ]),
        SizedBox(height: 100),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                // onTap: () {},
                trailing:  Switch(onChanged: (val){} ,value: true ),
                title: Text("Disable Notificatios"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouts.orders)  ;
                },
                trailing: Icon(Icons.shopping_basket_outlined),
                title: Text("Orders"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouts.orderArchived)  ;
                },
                trailing: Icon(Icons.archive_outlined),
                title: Text("Archived"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouts.viewAddress)  ;
                },
                trailing: Icon(Icons.location_on_outlined),
                title: Text("Address"),
              ),
              ListTile(
                onTap: () {},
                trailing: Icon(Icons.help_outline_rounded),
                title: Text("About us"),
              ),
              ListTile(
                onTap: () {
                  launchUrl(Uri.parse("tel:+01050625339"));
                },
                trailing: Icon(Icons.phone_callback_outlined),
                title: Text("Contact us"),
              ),
              ListTile(
                onTap: () {
                  controller.logout();
                },
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
              ),
            ]),
          ),
        )
      ],
    );
  }
}