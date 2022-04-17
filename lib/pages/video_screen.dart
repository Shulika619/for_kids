import 'package:flutter/material.dart';
import 'package:for_kids/pages/video_screen_detail.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Map<String, String> videoList = {
    'qEJ9m_9As6A': 'assets/video_images/едит_машинка.jpg',
    'QlnFqmnVRtM': 'assets/video_images/деревяшки.jpg',
    '00nLwjFdfOA': 'assets/video_images/буренка_даша.jpg',
    'kZUTrLqDJVQ': 'assets/video_images/хоки_поки.jpg',
    'K1q3Whf5lZ0': 'assets/video_images/про_ежика.jpg',
    'CDV3JPiiG6Q': 'assets/video_images/малыш_ку_ку.jpg',
    'py2RJyZozg4': 'assets/video_images/рыжая_кошка.jpg',
    'JydIFn3BpF4': 'assets/video_images/про_часы.jpg',
    'bzjtf3YCDfE': 'assets/video_images/часы_тик_так.jpg',
    '7ezHuBroilI': 'assets/video_images/викторина.jpg',
    'MIrzo07FHFg': 'assets/video_images/цыпленок_пи.jpg',
    'wXU9KHKB47w': 'assets/video_images/арам_зам_зам.jpg',
    'LbOve_UZZ54': 'assets/video_images/синий_трактор_по_полям.jpg',
    'B_OujydiQAc': 'assets/video_images/ежик_пых_пых.jpg',
    'BH583njFR0k': 'assets/video_images/мышонок.jpg',
    'AD7eMN2phjc': 'assets/video_images/котик_полосатый.jpg',
    'Wxoc78M9h9k': 'assets/video_images/розовый_котенок.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          String key = videoList.keys.elementAt(index).toString();
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoScreenDetail(videoId: key)),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(videoList[key] ?? 'Ошибка загрузки изображения'),
                  const Icon(Icons.play_circle, size: 60),
                ],
              ),
            ),
          );
        });
  }
}



//  return ListView.builder(
//         itemCount: videoIdItems.length,
//         itemBuilder: (context, index) => Container(
//               padding: const EdgeInsets.all(8),
//               child: YoutubePlayer(
//                 controller: YoutubePlayerController(
//                     initialVideoId: videoIdItems[index],
//                     flags: const YoutubePlayerFlags(autoPlay: false)),
//               ),
//             ));
///////////////////////////////////////
 