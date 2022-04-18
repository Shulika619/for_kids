class AudioFileModel {
  final String name;
  final String imgPath;
  final String audioPath;

  AudioFileModel(
      {required this.name, required this.imgPath, required this.audioPath});
}

abstract class AudioFilesList {
  static List<AudioFileModel> audioItems = [
    AudioFileModel(
        name: 'Брамс',
        imgPath: 'assets/images/колыбельная_брамс.jpg',
        audioPath: 'assets/audio/колыбельная_брамс.mp3'),
    AudioFileModel(
        name: 'Спи моя радость',
        imgPath: 'assets/images/спи_моя_радость_усни.jpg',
        audioPath: 'assets/audio/спи_моя_радость_усни.mp3'),
    AudioFileModel(
        name: 'Усталые игрушки',
        imgPath: 'assets/images/спят_усталые_игрушки.jpg',
        audioPath: 'assets/audio/спят_усталые_игрушки.mp3'),
    AudioFileModel(
        name: 'Цветняшки',
        imgPath: 'assets/images/сборник_цветняшки.jpg',
        audioPath: 'assets/audio/сборник_цветняшки.mp3'),
    AudioFileModel(
        name: 'Сверчок',
        imgPath: 'assets/images/за_печкой_поет_сверчок.jpg',
        audioPath: 'assets/audio/за_печкой_поет_сверчок.mp3'),
    AudioFileModel(
        name: 'Баю-баюшки',
        imgPath: 'assets/images/баю_баюшки_баю.jpg',
        audioPath: 'assets/audio/баю_баюшки_баю.mp3'),
    AudioFileModel(
        name: 'Буренка Даша',
        imgPath: 'assets/images/колыбельная_буренка_даша.jpg',
        audioPath: 'assets/audio/колыбельная_буренка_даша.mp3'),
    AudioFileModel(
        name: 'Медведица',
        imgPath: 'assets/images/колыбельная_медведицы.jpg',
        audioPath: 'assets/audio/колыбельная_медведицы.mp3'),
    AudioFileModel(
        name: 'Облака',
        imgPath: 'assets/images/пушистые_большие_облака.jpg',
        audioPath: 'assets/audio/пушистые_большие_облака.mp3'),
    AudioFileModel(
        name: 'Моцарт',
        imgPath: 'assets/images/колыбельная_моцарт.jpg',
        audioPath: 'assets/audio/колыбельная_моцарт.mp3'),
    AudioFileModel(
        name: 'Цып-Цып',
        imgPath: 'assets/images/колыбельная_цип_цип.jpg',
        audioPath: 'assets/audio/колыбельная_цип_цип.mp3'),
    AudioFileModel(
        name: 'Розовый Котенок',
        imgPath: 'assets/images/колыбельная_розовый_котенок.jpg',
        audioPath: 'assets/audio/колыбельная_розовый_котенок.mp3'),
  ];
}
