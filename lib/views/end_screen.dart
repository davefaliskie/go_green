import 'package:flutter/material.dart';
import 'package:go_green/game_end_state.dart';
import 'package:go_green/router.dart';
import 'package:go_green/widgets/wheel.dart';
import 'package:go_router/go_router.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({
    super.key,
    required this.gameEndState,
  });

  final GameEndState gameEndState;

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Game Over",
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
              if (widget.gameEndState == GameEndState.recycle)
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: const Wheel(),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("END STATE: ${widget.gameEndState.name}"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoute.game.name);
                },
                child: const Text("Play Again"),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoute.menu.name);
                },
                child: const Text(
                  "Main Menu",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
