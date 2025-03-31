import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/map_screen/controller/map_controller.dart';
import 'package:rms/presentation/map_screen/controller/state_Controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/drawer.dart';

class MapScreen extends GetView<MyMapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(text: 'Map View'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      drawer: MainDrawer(),
      body: FlutterMap(
        options: MapOptions(
                initialCenter: LatLng(41.590683627078, 12.962192729751701),
                initialZoom: 17.0,
              ),
      children: [
            TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
            markers: controller.markers.value,
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
            selectedIndex: 2,
            onTabChange: (index) {
              if (index == 0) {
                Get.toNamed(AppRoutes.homeScreen);
              }
              if(index == 1){
                Get.toNamed(AppRoutes.POI_Screen);
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