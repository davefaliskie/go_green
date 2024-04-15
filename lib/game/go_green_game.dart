import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_green/constants.dart';
import 'package:go_green/game/go_green_world.dart';
import 'package:go_green/game_end_state.dart';

class GoGreenGame extends FlameGame<GoGreenWorld>
    with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection {
  GoGreenGame({
    required this.endCallback,
    required this.level,
  }) : super(
          world: GoGreenWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final void Function(GameEndState endState) endCallback;
  final int level;

  // @override
  // FutureOr<void> onLoad() {
  //   super.onLoad();
  //   debugMode = true;
  // }

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.move(info.delta.global.x);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    const double moveSpeed = 55.0;

    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        world.player.move(moveSpeed);
        return KeyEventResult.handled;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        world.player.move(-moveSpeed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}
