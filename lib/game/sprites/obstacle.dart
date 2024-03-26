import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:go_green/constants.dart';
import 'package:go_green/game/go_green_game.dart';
import 'package:go_green/game/sprites/player.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    this.cirlceHitbox = false,
  });

  final String spritePath;
  final bool cirlceHitbox;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;

    if (cirlceHitbox == true) {
      add(CircleHitbox());
    } else {
      add(RectangleHitbox());
    }
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash()
      : super(
          spritePath: 'trash.png',
          cirlceHitbox: true,
        );
  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      // End State set
      debugPrint("TRASH object Was hit");
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleWater extends Obstacle {
  ObstacleWater()
      : super(
          spritePath: 'water.png',
          cirlceHitbox: true,
        );
  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      // End State set
      debugPrint("WATER object Was hit");
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleFire extends Obstacle {
  ObstacleFire()
      : super(
          spritePath: 'fire.png',
          cirlceHitbox: true,
        );
  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      // End State set
      debugPrint("FIRE object Was hit");
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
