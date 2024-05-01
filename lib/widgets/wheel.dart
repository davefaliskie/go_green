import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Wheel extends StatefulWidget {
  const Wheel({super.key});

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  StreamController<int> controller = StreamController<int>();
  int? outcome;

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 6,
      child: FortuneWheel(
        selected: controller.stream,
        animateFirst: false,
        hapticImpact: HapticImpact.medium,
        indicators: const [
          FortuneIndicator(
            alignment: Alignment.topCenter,
            child: TriangleIndicator(
              color: Colors.black45,
              width: 30.0,
              height: 40.0,
              elevation: 10,
            ),
          ),
        ],
        items: [
          FortuneItem(
            child: const RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Icon(
                  Icons.recycling,
                  color: Colors.white,
                  size: 55,
                ),
              ),
            ),
            style: FortuneItemStyle(
              color: Colors.blue.shade800.withAlpha(50),
              borderWidth: 0,
            ),
          ),
          ..._losing90(
            imagePath: "assets/images/trash.png",
            color: Colors.white.withAlpha(150),
          ),
        ],
        onFling: () {
          List<int> outcomes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

          setState(() {
            outcome = outcomes[Random().nextInt(outcomes.length)];
          });

          controller.add(outcome ?? 1);
        },
        onAnimationEnd: () {
          if (outcome == 0) {
            // redirect to win screen
          } else {
            // redirect to lose screen
          }
        },
      ),
    );
  }

  List<FortuneItem> _losing90({
    required String imagePath,
    required Color color,
  }) {
    List<FortuneItem> output = [];
    for (var item = 0; item < 9; item++) {
      output.add(
        FortuneItem(
          child: RotatedBox(
            quarterTurns: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Image.asset(
                imagePath,
                width: 55,
              ),
            ),
          ),
          style: FortuneItemStyle(color: color, borderWidth: 0),
        ),
      );
    }
    return output;
  }
}
