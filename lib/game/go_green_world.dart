import 'dart:async';

import 'package:flame/components.dart';
import 'package:go_green/constants.dart';
import 'package:go_green/game/go_green_game.dart';
import 'package:go_green/game/sprites/bin.dart';
import 'package:go_green/game/sprites/obstacle.dart';
import 'package:go_green/game/sprites/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Player();

    add(player);
    add(Bin());

    add(ObstacleTrash()..position = Vector2(0, 0));
    add(ObstacleWater()..position = Vector2(-obstacleSize * 2, 0));
    add(ObstacleFire()..position = Vector2(obstacleSize * 2, 0));
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.position.y -= (dt * 400);

      if (obstacle.position.y < -(gameRef.size.y / 2)) {
        obstacle.position.y = extendedHeight;
      }
    });
  }
}
