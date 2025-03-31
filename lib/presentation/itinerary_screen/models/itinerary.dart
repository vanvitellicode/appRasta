import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/widgets/place_itinerary.dart';

class Itinerary {
  String name;
  String image;
  String rating;
  String duration;
  String vehicle;
  List<Place> places;

  Itinerary({
    required this.name,
    required this.image,
    required this.rating,
    required this.duration,
    required this.vehicle,
    required this.places,
  });


  PlaceItinerary toCard() {
    return PlaceItinerary(
      itineraryItem: Itinerary(      
      name: name,
      image: image,
      rating: rating,
      duration: duration,
      vehicle: vehicle,
      places: places,)
    );
  }
 
}