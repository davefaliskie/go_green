import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:go_green/game/go_green_game.dart';
import 'package:go_green/game/sprites/obstacle.dart';
import 'package:go_green/game/sprites/player.dart';

class Bin extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Bin({
    required this.spritePath,
  });

  final String spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  bool onComponentTypeCheck(PositionComponent other) {
    if (other is Obstacle || other is Bin) {
      // do NOT collide with Other Obsticles or Bins
      return false;
    }
    return super.onComponentTypeCheck(other);
  }
}

class BinTrash extends Obstacle {
  BinTrash() : super(spritePath: 'bin_trash.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      // End State set
      debugPrint("Hit TRASH");
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class BinRecycle extends Obstacle {
  BinRecycle() : super(spritePath: 'bin_recycle.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      debugPrint("Hit Recycling Bin!");
      // Win State set
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
