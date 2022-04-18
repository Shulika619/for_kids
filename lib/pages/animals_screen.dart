import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({Key? key}) : super(key: key);
  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  static const List<String> animals = [
    'белка',
    'волк',
    'дикий кабан',
    'дятел',
    'еж',
    'енот',
    'змея',
    'коза',
    'корова',
    'кошка',
    'крыса',
    'кукушка',
    'леопард',
    'лиса',
    'лошадь',
    'лягушка',
    'медведь',
    'морской котик',
    'носорог',
    'обезьяна',
    'орел',
    'осел',
    'слон',
    'собака'
  ];
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
    return GridView.builder(
      itemCount: animals.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 4,
        childAspectRatio: 6 / 9,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            if (playingIndex == index) {
              setState(() {
                playingIndex = null;
              });
              _player.stop();
            } else {
              try {
                await _player
                    .setAsset('assets/animal_sounds/${animals[index]}.mp3');
                _player.play();
                await _player.setLoopMode(LoopMode.one);
                setState(() {
                  playingIndex = index;
                });
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.amber.withOpacity(0.5),
                    content: Text('Ошибка загрузки звука \n $error')));
              }
            }
          },
          child: GridTile(
            header: Container(
              padding: const EdgeInsets.only(top: 10),
              child: playingIndex == index
                  ? const Icon(
                      Icons.volume_up,
                      color: Colors.amber,
                      size: 32,
                    )
                  : const Icon(
                      Icons.volume_down,
                      color: Colors.amber,
                      size: 30,
                    ),
            ),

            // margin: EdgeInsets.zero,
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/animal_images/${animals[index]}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
