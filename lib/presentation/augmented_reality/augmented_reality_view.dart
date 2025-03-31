
import 'package:flutter/material.dart';
import 'package:ar_location_view/ar_location_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/augmented_reality/annotation_dialog.dart';
import 'package:rms/presentation/augmented_reality/controller/augmented_reality_controller.dart';
import 'package:rms/presentation/augmented_reality/models/annotations.dart';




class AugmentedRealityScreen extends GetView<AugmentedRealityController> {

  const AugmentedRealityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ArLocationWidget(
          annotations: controller.annotations,
          showDebugInfoSensor: false,
          
          annotationViewBuilder: (context, annotation) {
            return AnnotationView(
              key: ValueKey(annotation.uid),
              annotation: annotation as Annotation,
            );
          },
          onLocationChange: (Position position) {
            Future.delayed(const Duration(seconds: 1), () {
              controller.fakeAnnotation(position: position, numberMaxPoi: 1);
              
            });
          },
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
            selectedIndex: 3,
            onTabChange: (index) {
              if (index == 0) {
                Get.toNamed(AppRoutes.homeScreen);
              }
              if(index == 1){
                Get.toNamed(AppRoutes.POI_Screen);
              }
              if(index == 2){
                Get.toNamed(AppRoutes.mapScreen);
              }
            },
            ),
          ),
        ),
      ),
      );
  }
}
