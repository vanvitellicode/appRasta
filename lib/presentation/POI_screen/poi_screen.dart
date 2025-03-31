import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/app_bar/appbar_image.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/drawer.dart';
import 'package:rms/widgets/place_item.dart';
import 'controller/poi_controller.dart';

class POIScreen extends GetView<POIController> {
  const POIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFC),
      appBar: AppBar(
        title: AppbarTitle(text: 'Itinerario'),
        automaticallyImplyLeading: true,
        centerTitle: true,

      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          // Insert search bar

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.POIModelObj.value.places.length,
              itemBuilder: (context, index) {
                return PlaceItem(place: controller.POIModelObj.value.places[index]);
              },
            ),
          ),
        ],
      ),
bottomNavigationBar:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.grey[800]!,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey[800]!,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                  GButton(
                  icon: Icons.route,
                  text: 'Route',
                ),
                GButton(
                  icon: Icons.map,
                  text: 'Map',
                ),
                 GButton(
                  icon: IconData(0xe6b4, fontFamily: 'MaterialIcons'),
                  text: 'AR',
                ),
              ],
            selectedIndex: 1,
            onTabChange: (index) {
              if (index == 0) {
                Get.toNamed(AppRoutes.homeScreen);
              }
              if(index == 2){
                Get.toNamed(AppRoutes.mapScreen);
              }
              if(index == 3){
                Get.toNamed(AppRoutes.augmentedRealityScreen);
              }
            },
            ),
          ),
        ),
      ),
    );
  }
}