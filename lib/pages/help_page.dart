import 'package:breathing/text/custome_text.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Welcome to our breathing exercise app! This app is designed to guide you through a simple breathing exercise to help you relax and reduce stress. On the home page, you'll find two buttons\n\n"
                  "Start: Press the \"Start\" "
                  " button to begin the breathing exercise. This will initiate the animation and counting of breaths. You'll see a soothing animation indicating when to inhale, hold, and exhale.\n\n"
                  "If you need to pause the exercise at any time, simply tap on the animation, and it will stop. You'll then be returned to the home page.\n\n"
                  "We hope you find this app helpful in managing your stress and promoting relaxation. Remember to take deep breaths and focus on the present moment. Enjoy your breathing journey!",
                  style: Customtext.titleStyle,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
