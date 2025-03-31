import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rms/core/app_export.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
              color: Colors.white,
            ),
        child: ListView(
          padding: EdgeInsets.zero,

          children: <Widget>[
            DrawerHeader(
              child: Image(
                            image: AssetImage(ImageConstant.imgVectorBlueA70034x360,),
                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.8,),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                    width: 0.5,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              tileColor: Get.currentRoute == AppRoutes.itinerary_screen ? const Color.fromARGB(255, 253, 0, 0) : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.offNamed(AppRoutes.homeScreen);
              },
            ),
            ListTile(
              leading: Icon(Icons.streetview),
              title: Text('Itinerary Overview'),
              tileColor: Get.currentRoute == AppRoutes.itinerary_screen ? Colors.grey[300] : null,
              onTap: () {
                Get.back();
                Get.offNamed(AppRoutes.POI_Screen);
              },
            ),
            
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Itinerary Settings'),              
              tileColor: Get.currentRoute == AppRoutes.sessionInfoScreen ? Colors.grey[300] : null,
              onTap: () {
                Get.back();
                Get.offNamed(AppRoutes.sessionInfoScreen);
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chat'),
              tileColor: Get.currentRoute == AppRoutes.chatScreen ? Colors.grey[300] : null,
              onTap: () {
                Get.back();
                Get.offNamed(AppRoutes.chatScreen);
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code),
              title: Text('Visulize 3D Model'),
              tileColor: Get.currentRoute == AppRoutes.arviewerScreen ? Colors.grey[300] : null,
              onTap: () {
                Get.back();
                Get.offNamed(AppRoutes.qrscannerviewerScreen);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),              
              tileColor: Get.currentRoute == AppRoutes.sessionInfoScreen ? Colors.grey[300] : null,
              onTap: () {
                Get.back();
                Get.offNamed(AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}