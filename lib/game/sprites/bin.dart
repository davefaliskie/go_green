import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:go_green/game/sprites/obstacle.dart';
import 'package:go_green/game/sprites/player.dart';
import 'package:go_green/game_end_state.dart';

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
      game.endCallback(GameEndState.trash);
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
      game.endCallback(GameEndState.recycle);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
