import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:latlong2/latlong.dart';

class POIModel {


 RxList<Place> places = <Place>[].obs;
 
 static List<Place> getDemoData() {
    return [
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
    ];
  }


}
