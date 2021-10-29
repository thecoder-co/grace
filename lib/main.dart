import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:spring/spring.dart';

//import 'package:simple_animations/simple_animations.dart';

import 'package:grace/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.open(
      Audio('assets/Chopin - Nocturne op.9 No.2.mp3'),
      autoStart: true,
      showNotification: false,
    );
    setState(() {
      audioPlayer.play();
    });
  }

  bool _play = false;
  double chgval = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff0047AB),
              Color(0xffF4989C),
            ],
          ),
          color: Color(0xFF0047AB),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, bottom: 50.0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff02040F),
                  ),
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Grace, go on a journey with me👉️👈️',
                          textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffA1C6EA),
                          ),
                          textAlign: TextAlign.center,
                          speed: const Duration(milliseconds: 150),
                        ),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => MainPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF02040F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.5 - 70),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffA1C6EA),
                        ),
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 20, end: chgval),
                        duration: const Duration(milliseconds: 1000),
                        onEnd: () => setState(
                          () {
                            chgval = chgval == 20.0 ? 50.0 : 20.0;
                          },
                        ),
                        builder:
                            (BuildContext context, double size, Widget? child) {
                          return SizedBox(
                            width: size,
                          );
                        },
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xffA1C6EA),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
