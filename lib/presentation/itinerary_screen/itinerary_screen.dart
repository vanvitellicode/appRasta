import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/app_bar/appbar_image.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/drawer.dart';
import 'package:rms/widgets/place_item.dart';
import 'package:rms/widgets/place_itinerary.dart';
import 'controller/itinerary_controller.dart';

class ItineraryScreen extends GetView<ItineraryController> {
  const ItineraryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(text: 'Lista Itinerari'),
        centerTitle: true,
        automaticallyImplyLeading: true,

      ),

      drawer: MainDrawer(),

      body: Column(
        children: [
          // Insert search bar
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.placeList.length,
              itemBuilder: (context, index) {
                 return GestureDetector(
                    onTap: () {
                      // Azione da eseguire quando la card viene cliccata

                      print('Card cliccata: ${controller.placeList[index]}');
                    },
                    child: controller.placeList[index].toCard(),
                  );
              },
            ),
          ),
        ],
      ),

    ) ;

  }
}