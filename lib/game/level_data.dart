import 'package:flame/components.dart';
import 'package:go_green/constants.dart';

enum ObstacleType {
  trash,
  water,
  fire,
  // binTrash,
  // binRecycle,
}

class ObstacleData {
  final Vector2 position;
  final ObstacleType type;

  ObstacleData({required this.position, required this.type});
}

class LevelData {
  final obstacleSpacing = obstacleSize + (playerHeight * 2);
  final leftSide = -(gameWidth / 2) + (obstacleSize / 2);
  final rightSide = (gameWidth / 2) - (obstacleSize / 2);

  List<ObstacleData> level1() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
      item2: ObstacleType.fire,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item2: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item1: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item2: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item1: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.trash,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
    ));

    // level.addAll(obstacleRow(
    //   row: 12,
    //   item1: ObstacleType.binRecycle,
    //   item2: ObstacleType.binTrash,
    //   item3: ObstacleType.binRecycle,
    //   item4: ObstacleType.binTrash,
    //   item5: ObstacleType.binRecycle,
    // ));

    return level;
  }

  // reusable row
  List<ObstacleData> obstacleRow({
    required int row,
    ObstacleType? item1,
    ObstacleType? item2,
    ObstacleType? item3,
    ObstacleType? item4,
    ObstacleType? item5,
  }) {
    List<ObstacleData> content = [];
    final yPosition = obstacleSpacing * row;

    if (row < 0 || row > 14) {
      throw Exception("Row is out of range must be between 0..14");
    }

    if (item1 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide, yPosition),
          type: item1,
        ),
      );
    }
    if (item2 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide + (gameWidth / 5), yPosition),
          type: item2,
        ),
      );
    }
    if (item3 != null) {
      content.add(
        ObstacleData(
          position: Vector2(0, yPosition),
          type: item3,
        ),
      );
    }
    if (item4 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide - (gameWidth / 5), yPosition),
          type: item4,
        ),
      );
    }
    if (item5 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide, yPosition),
          type: item5,
        ),
      );
    }

    return content;
  }
}
