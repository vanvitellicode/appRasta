import 'package:cached_network_image/cached_network_image.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';

import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/app_bar/appbar_image.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PlaceItem extends StatelessWidget {
  final Place place;

  const PlaceItem({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
              print("cliccato");
              Get.toNamed(AppRoutes.poiinformationScreen, arguments: place);

          },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            
          ),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  text: 'Rating: ',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${place.rating}  ',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Color.fromARGB(255, 177, 161, 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Average Time: ',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: place.duration,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Suggested Vehicle: ',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: place.vehicle,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
        
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}