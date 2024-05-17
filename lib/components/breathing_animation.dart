import 'dart:async';

import 'package:breathing/text/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vibration/vibration.dart';

class BreathingAnimation extends StatefulWidget {
  const BreathingAnimation({super.key});

  @override
  State<BreathingAnimation> createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? timer;

  static const seconds = 0;
  int timerseconds = seconds;
  static const int cycleDuration = 16;

  @override
  void initState() {
    super.initState();
    startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  bool isBreathig = false;

  void startTimer() {
    _vibrate();
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        timerseconds++;
        animationcontroller();
      });
    });
  }

  String alert = "Inhale";

  void animationcontroller() {
    final int currentCycleTime = timerseconds % cycleDuration;

    if (currentCycleTime < 4) {
      if (!_controller.isAnimating) {
        _controller.forward();
        // alert = "Inhale";
      }
    } else if (currentCycleTime < 8) {
      if (_controller.isAnimating) {
        _controller.stop();
        alert = "Hold";
      }
    } else if (currentCycleTime < 12) {
      if (!_controller.isAnimating) {
        _controller.reverse();
        alert = "Exhale";
      }
    } else {
      if (_controller.isAnimating) {
        _controller.stop();
        alert = "Hold";
      }
    }

    if (currentCycleTime % 4 == 0) {
      _vibrate();
    }
  }

  void _vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 50);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Lottie.asset(
            'images/breathing.json',
            controller: _controller,
          ),
        ),
        const SizedBox(height: 25.00),
        Text(
          'Seconds: ${timerseconds.toString()}',
          style: Customtext.bigtitleStyle,
        ),
        const SizedBox(height: 25.00),
        Text(
          alert,
          style: Customtext.bigtitleStyle,
        ),
      ],
    );
  }
}
