import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> videoIdItems = ['BH583njFR0k', '7ezHuBroilI', 'AD7eMN2phjc'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: videoIdItems.length,
        itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: videoIdItems[index],
                    flags: const YoutubePlayerFlags(autoPlay: false)),
              ),
            ));
  }
}

 // late YoutubePlayerController controller;
  // @override
  // void initState() {
  //   controller = YoutubePlayerController(
  //       initialVideoId: videoIdItems.first,
  //       flags: const YoutubePlayerFlags(autoPlay: false));
  //   super.initState();
  // }

  // @override
  // void deactivate() {
  //   // Pauses video while navigating to next page.
  //   controller.pause();
  //   super.deactivate();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

 // return YoutubePlayerBuilder(
    //   player: YoutubePlayer(controller: controller),
    //   builder: (context, player) {
    //     return Scaffold(body: Column(children: [
    //       player,
    //     ],),);
    //   },
    // );