import 'package:rms/presentation/Home_screen/binding/home_binding.dart';
import 'package:rms/presentation/account_creation_screen/account_creation_screen.dart';
import 'package:rms/presentation/account_creation_screen/binding/account_creation_binding.dart';
import 'package:rms/presentation/ar_viewer/augmented_reality_viewer_view.dart';
import 'package:rms/presentation/ar_viewer/binding/ar_viewer_binding.dart';
import 'package:rms/presentation/augmented_reality/augmented_reality_view.dart';
import 'package:rms/presentation/augmented_reality/binding/ar_binding.dart';
import 'package:rms/presentation/chat/binding/chat_binding.dart';
import 'package:rms/presentation/chat/chat_screen.dart';
import 'package:rms/presentation/home_screen/home_screen.dart';
import 'package:rms/presentation/itinerary_screen/binding/itinerary_binding.dart';
import 'package:rms/presentation/itinerary_screen/itinerary_screen.dart';
import 'package:rms/presentation/login_screen/login_screen.dart';
import 'package:rms/presentation/login_screen/binding/login_binding.dart';
import 'package:rms/presentation/map_screen/binding/map_binding.dart';
import 'package:rms/presentation/map_screen/map_screen.dart';
import 'package:rms/presentation/poi_information_screen/binding/poi_information.dart';
import 'package:rms/presentation/poi_information_screen/poi_information_screen.dart';
import 'package:rms/presentation/qrcode_screen/binding/qrcode_binding.dart';
import 'package:rms/presentation/qrcode_screen/qrcode_view.dart';

import 'package:rms/presentation/session_info_screen/session_info_screen.dart';
import 'package:rms/presentation/session_info_screen/binding/session_info_binding.dart';


import 'package:rms/presentation/splash_screen/splash_screen.dart';
import 'package:rms/presentation/splash_screen/binding/splash_binding.dart';
import 'package:rms/presentation/POI_screen/binding/poi_binding.dart';
import 'package:rms/presentation/POI_screen/poi_screen.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const String accountCreationScreen = '/account_creation_screen';

  static const String loginScreen = '/login_screen';

  static const String sessionInfoScreen = '/session_info_screen';

  static const String splashScreen = '/splash_screen';

  static const String POI_Screen = '/POI_screen';

  static const String itinerary_screen = '/itinerary_screen';

  static const String initialRoute = '/initialRoute';
  static const String mapScreen = '/map';
  static const String homeScreen = '/home';
  static const String augmentedRealityScreen = '/augmentedReality';
  static const String poiinformationScreen = '/poiinformation';
  static const String chatScreen = '/chat';
  static const String arviewerScreen = '/arviewer';
  static const String qrscannerviewerScreen = '/qrscanner';



  static List<GetPage> pages = [
    GetPage(
      name: accountCreationScreen,
      page: () => AccountCreationScreen(),
      bindings: [
        AccountCreationBinding(),
      ],
    ),
    GetPage(
      name: chatScreen,
      page: () => ChatScreen(),
      bindings: [
        ChatBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),

    GetPage(
      name: mapScreen,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),

    GetPage(
      name: sessionInfoScreen,
      page: () => SessionInfoScreen(),
      bindings: [
        SessionInfoBinding(),
      ],
    ),

    // GetPage(
    //   name: paginationScreen,
    //   page: () => PaginationScreen(),
    //   bindings: [
    //     PaginationBinding(),
    //   ],
    // ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: POI_Screen,
      page: () => POIScreen(),
      bindings: [
        POIBinding(),
      ],
    ),
    GetPage(
      name: itinerary_screen,
      page: () => ItineraryScreen(),
      bindings: [
        ItineraryBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: augmentedRealityScreen,
      page: () => AugmentedRealityScreen(),
      bindings: [
        AugmentedRealityBinding(),
      ],
    ),
    GetPage(
      name: poiinformationScreen,
      page: () => PoiInformationScreen(),
      bindings: [
        PoiInformationBinding(),
      ],
    ),
    GetPage(
      name: arviewerScreen,
      page: () => AugmentedRealityViewerScreen(),
      bindings: [
        ARViewerBinding(),
      ],
    ),
    GetPage(
      name: qrscannerviewerScreen,
      page: () => QRScannerView(),
      bindings: [
        QRScannerBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}

