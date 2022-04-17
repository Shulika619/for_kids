import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreenDetail extends StatefulWidget {
  final String? videoId;
  const VideoScreenDetail({Key? key, this.videoId}) : super(key: key);

  @override
  State<VideoScreenDetail> createState() => _VideoScreenDetailState();
}

class _VideoScreenDetailState extends State<VideoScreenDetail> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId ?? 'QTqUul-LMSU',
        flags: const YoutubePlayerFlags(
          autoPlay: true, mute: false
        ));
    super.initState();
  }

  // @override
  // void deactivate() {
  //   // Pauses video while navigating to next page.
  //   controller.pause();
  //   super.deactivate();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: const Text('Назад')),
          body: SafeArea(
            child: Center(
              child: player,
              
            ),
          ),
        );
      },
    );
  }
}

