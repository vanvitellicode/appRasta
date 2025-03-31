import 'package:cached_network_image/cached_network_image.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/widgets/drawer.dart';

import 'controller/poi_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/app_bar/appbar_image.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/app_bar/custom_app_bar.dart';
import 'package:rms/widgets/custom_button.dart';
import 'package:rms/widgets/custom_drop_down.dart';
import 'package:rms/widgets/custom_text_form_field.dart';

class PoiInformationScreen extends GetWidget<PoiInformationController> {
  final PoiInformationController controller = Get.put(PoiInformationController());
  final Place place = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(text: 'POI Info'),
        centerTitle: true,
        automaticallyImplyLeading: true,

      ),
      
      body: ListView(
        children: [
          Padding(
                padding: const EdgeInsets.all(24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child:  CachedNetworkImage(
                    imageUrl: place.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "How To Reach:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(place.vehicle),
                SizedBox(height: 8),
                Text(
                  "Description:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(place.description),

                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(String name, String price) {
    return ListTile(
      leading: Icon(Icons.fastfood),
      title: Text(name),
      trailing: Text('€$price'),
    );
  }
}