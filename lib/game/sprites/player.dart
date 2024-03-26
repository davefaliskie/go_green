import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:go_green/constants.dart';
import 'package:go_green/game/go_green_game.dart';

class Player extends SpriteComponent with HasGameRef<GoGreenGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("player.png");
    size = Vector2(playerWidth, playerHeight);
    position = Vector2(0, -(gameHeight / 2) + (size.y / 2));
    angle = 0.5;
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    double newY = position.y + (dt * 400);

    if (newY > -(gameHeight / 4)) {
      newY = -(gameHeight / 4);
    }

    if (newY > (gameRef.size.y / 2) - (size.y / 2)) {
      newY = (gameRef.size.y / 2) - (size.y / 2);
    }

    position.y = newY;
  }

  void move(double deltaX) {
    double newX = position.x + deltaX;

    double minX = -(gameRef.size.x / 2) + size.x / 2; // Left boundary
    double maxX = (gameRef.size.x / 2) - size.x / 2; // Right boundary
    newX = newX.clamp(minX, maxX);

    position.x = newX;
  }
}
