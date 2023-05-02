import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Application',
          style: GoogleFonts.lobster(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
      ),
      body: DiceGame(),
    ),
  ));
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftdice = 1;
  int rightdice = 2;
  AudioCache audioCache = AudioCache();

  void initState() {
    super.initState();
    audioCache.load('diceRoll.mp3');
  }

  void playSound() async {
    audioCache.play('diceRoll.mp3');
  }

  rolldices() {
    playSound();
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Image.asset('images/dice.jpeg'),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('images/$leftdice.jpg'),
              ),
            ),
            SizedBox(
                width: 16.0), // Add SizedBox with desired width for spacing
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset('images/$rightdice.jpg'),
              ),
            ),
          ],
        )),
        ElevatedButton(
          onPressed: () {
            rolldices();
          },
          child: Text(
            'Roll Dices',
            style: GoogleFonts.lobster(fontSize: 20),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
