import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import './models/annotations.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnotationView extends StatelessWidget {
  const AnnotationView({
    Key? key,
    required this.annotation,
  }) : super(key: key);

  final Annotation annotation;

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      _launchURL(annotation.url);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: typeFactory(annotation.type),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      _buildVideoPlayer('flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
                  ],
                ),
          
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    annotation.type.toString().substring(15),
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${annotation.distanceFromUser.toInt()} m',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

    _launchURL(String url) async {
      //parse the url to uri
      Uri toLaunch = Uri(scheme: 'https', host: 'www.google.com');
      if (!await launchUrl(
        toLaunch,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }
  Widget _buildVideoPlayer(String videoUrl) {

    VideoPlayerController _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
  Widget typeFactory(AnnotationType type) {
    IconData iconData = Icons.ac_unit_outlined;
    Color color = Colors.teal;
    switch (type) {
      case AnnotationType.CRBUniPG:
        iconData = Icons.school;
        color = Colors.blue;
        break;
      case AnnotationType.OldPark:
        iconData = Icons.local_parking;
        color = Colors.green;
        break;
      case AnnotationType.Chiesa:
        iconData = Icons.church;
        color = Colors.blue;
        break;
    }
    return Icon(
      iconData,
      size: 40,
      color: color,
    );
  }
}
