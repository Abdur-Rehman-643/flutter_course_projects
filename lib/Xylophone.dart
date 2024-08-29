import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Container buildKey({required Color mycolor, required int soundnumber}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      height: 150,
      decoration: BoxDecoration(
        color: mycolor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () async {
          AudioPlayer player = AudioPlayer();
          await player.play(AssetSource("notes/note$soundnumber.wav"));
        },
        child: Text(
          "",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(mycolor: Colors.red, soundnumber: 1),
              buildKey(mycolor: Colors.orange, soundnumber: 2),
              buildKey(mycolor: Colors.yellow, soundnumber: 3),
              buildKey(mycolor: Colors.green, soundnumber: 4),
              buildKey(mycolor: Colors.blue, soundnumber: 5),
              buildKey(mycolor: Colors.indigo, soundnumber: 6),
              buildKey(mycolor: Colors.purple, soundnumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
