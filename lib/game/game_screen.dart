import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_green/constants.dart';
import 'package:go_green/game/go_green_game.dart';
import 'package:go_green/game_end_state.dart';
import 'package:go_green/local_data/hive_repository.dart';
import 'package:go_green/router.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late final GoGreenGame game;

  @override
  void initState() {
    super.initState();
    game = GoGreenGame(
      level: ref.read(hiveRepositoryProvider).setLevel(),
      endCallback: (GameEndState endState) {
        // save attempt
        ref.read(hiveRepositoryProvider).saveAttempt(endState);

        // redirecting
        switch (endState) {
          case GameEndState.trash:
            context.goNamed(AppRoute.endTrash.name);
            break;
          case GameEndState.water:
            context.goNamed(AppRoute.endWater.name);
            break;
          case GameEndState.fire:
            context.goNamed(AppRoute.endFire.name);
            break;
          case GameEndState.recycle:
            context.goNamed(AppRoute.endRecycle.name);
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: gameWidth,
              height: gameHeight,
              child: GameWidget(game: game),
            ),
          ),
        ),
      ),
    );
  }
}
