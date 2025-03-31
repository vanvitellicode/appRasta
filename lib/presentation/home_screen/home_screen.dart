import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/Home_screen/controller/home_controller.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/custom_button.dart';
import 'package:rms/widgets/drawer.dart';

class HomeScreen extends GetView<Home_Controller> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(text: 'HomePage'),
        centerTitle: true,
        automaticallyImplyLeading: true,

      ),

      drawer: MainDrawer(),

      body: Obx( () =>  
           Column(
          children: [
            controller.placeList.isEmpty
                ? Container(
                    child: Padding(
                      padding: const EdgeInsets.all(64.0),
                      child: Column(
                        children: [
                          Text('No itineraries yet'),
                          Text('Create a new itinerary to get started'),
                        ],
                      ),
                    ),
                  )
                :   Text('Continue your journey'),
                    // Insert search bar
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.placeList.length,
                        itemBuilder: (context, index) {
                          return controller.placeList[index].toCard();
                        },
                      ),
                    ),
            //create a button to add a new itinerary
            Container(
              child: Padding(
                padding: const EdgeInsets.all(64.0),
                child: Column(
                  children: [
                    Text('Or create a new itinerary'),
                    
                    CustomButton(
                        height: getVerticalSize(50),
                        text: "Create",
                        margin: getMargin(top: 29, bottom: 5),
                        onTap: () {
                          Get.toNamed(AppRoutes.sessionInfoScreen);
                        })
        
                  ],
                ),
              )
              ),
            
          ],
        )
      
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
            selectedIndex: 0,
            onTabChange: (index) {
              if (index == 1) {
                Get.toNamed(AppRoutes.POI_Screen);
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

    ) ;

  }
}