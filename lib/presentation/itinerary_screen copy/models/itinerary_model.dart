
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary.dart';
import 'package:latlong2/latlong.dart';

class ItineraryModel {

 static List<Itinerary> getDemoData() {
    return [
      Itinerary(
        name: 'Itinerario 1',
        image: 'assets/images/itinerario1.jpg',
        rating: '4.1',
        duration: '30 min',
        vehicle: 'Bus',
        places: 
                    [
                  Place(
                    name: 'Piazza Perugia ',
                    image: 'assets/images/perugia1.jpg',
                    rating: '4.1',
                    duration: '12 min',
                    vehicle: 'Bus',
                                          location: LatLng(43.1107, 12.3908)

                  ),
                  Place(
                    name: 'Piazza Perugia',
                    image: 'assets/images/perugia2.jpg',
                    rating: '4.5',
                    duration: '3 min',
                    vehicle: 'Foot',
                                          location: LatLng(43.1107, 12.3908)

                  ),
                ]
      ),
      Itinerary(
        name: 'Itinerario 2',
        image: 'assets/images/itinerario2.jpg',
        rating: '4.5',
        duration: '45 min',
        vehicle: 'Foot',
        places:  [
                    Place(
                      name: 'Piazza Milano ',
                      image: 'assets/images/perugia1.jpg',
                      rating: '4.1',
                      duration: '12 min',
                      vehicle: 'Bus',
                                            location: LatLng(43.1107, 12.3908)

                    ),
                    Place(
                      name: 'Piazza Roma',
                      image: 'assets/images/perugia2.jpg',
                      rating: '4.5',
                      duration: '3 min',
                      vehicle: 'Foot',
                                            location: LatLng(43.1107, 12.3908)

                    ),
                  ]
      ),
    ];
  }


}
