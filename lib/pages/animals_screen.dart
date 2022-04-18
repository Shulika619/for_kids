import 'package:flutter/material.dart';


class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({ Key? key }) : super(key: key);

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.cyan,
      child: const Center(child: Text("Животные")),
    );
  }
}