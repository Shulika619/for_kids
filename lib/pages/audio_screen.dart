import 'package:flutter/material.dart';
import 'package:for_kids/models/audio_model.dart';
import 'package:just_audio/just_audio.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _player;
  int? playingIndex;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: AudioFilesList.audioItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                if (playingIndex == index) {
                  setState(() {
                    playingIndex = null;
                  });
                  _player.stop();
                } else {
                  try {
                    await _player
                        .setAsset(AudioFilesList.audioItems[index].audioPath);
                    _player.play();
                    await _player.setLoopMode(LoopMode.one);
                    setState(() {
                      playingIndex = index;
                    });
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.amber.withOpacity(0.5),
                        content: Text('Упс, ошибка \n $error')));
                    // log(error);
                  }
                }
              },
              child: Container(
                height: 150,
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image:
                          AssetImage(AudioFilesList.audioItems[index].imgPath),
                      fit: BoxFit.cover,
                    )),
                child: ListTile(
                  title: Text(
                    AudioFilesList.audioItems[index].name,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[800],
                        shadows: const [
                          Shadow(
                              color: Colors.white70,
                              offset: Offset(1, 2),
                              blurRadius: 4)
                        ]),
                  ),
                  trailing: playingIndex == index
                      ? const Icon(Icons.stop_circle, size: 50)
                      : const Icon(Icons.play_circle, size: 50),
                ),
              ),
            ),
          );
        });
  }
}
