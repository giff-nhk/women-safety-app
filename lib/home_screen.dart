import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:liki_pro/child/bottomscreen.dart';
import 'package:liki_pro/wigets/custom_appbar.dart';
import 'package:liki_pro/wigets/customcaro.dart';
import 'package:liki_pro/wigets/home_widgets/emergency.dart';
import 'package:liki_pro/wigets/home_widgets/safehome/Safehome.dart';
import 'package:liki_pro/wigets/livesafe.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qIndex = 0;

  getRandomquote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(5);
    });
  }

  @override
  void initState() {
    getRandomquote();
    super.initState();
    //shake feature//
    // ShakeDetector.autoStart(
    //   onPhoneShake: () {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Shake!'),
    //       ),
    //     );
    //     // Do stuff on phone shake
    //   },
    //   minimumShakeCount: 1,
    //   shakeSlopTimeMS: 500,
    //   shakeCountResetTime: 3000,
    //   shakeThresholdGravity: 2.7,
    // );

    // // To close: detector.stopListening();
    // // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 219, 219),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomAppbar(
                  quoteIndex: qIndex,
                  onTap: getRandomquote,
                ),
                Customcaro(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Emergency",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Emergency(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Explore LiveSafe",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Livesafe(),
                SafeHome(),
              ],
            ),
          ),
        ),
      ),
      // Placed BottomPage() here
    );
  }
}
