import 'package:breathing/components/breathing_animation.dart';
import 'package:breathing/pages/help_page.dart';
import 'package:breathing/text/custome_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBreathing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isBreathing
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isBreathing = false;
                      });
                    },
                    child: const BreathingAnimation())
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Breath In",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 50.00),
                        ),
                        const SizedBox(height: 100.00),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isBreathing = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue, // Change background color here
                            ),
                            child: const Text(
                              "start",
                              style: Customtext.whitebuttonTextStyle,
                            )),
                        const SizedBox(height: 25.00),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HelpPage(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue, // Change background color here
                            ),
                            child: const Text(
                              "Help",
                              style: Customtext.whitebuttonTextStyle,
                            )),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
