import 'package:flame/components.dart';
import 'package:go_green/constants.dart';

enum ObstacleType {
  trash,
  water,
  fire,
  binTrash,
  binRecycle,
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

  List<ObstacleData> getLevel(int levelNumber) {
    final Map<int, List<ObstacleData> Function()> levelConfigs = {
      1: () => level1(),
      2: () => level2(),
      3: () => level3(),
      4: () => level4(),
      // 5: () => level5(),
    };
    if (levelConfigs.containsKey(levelNumber)) {
      return levelConfigs[levelNumber]!();
    } else {
      throw Exception('Level not found');
    }
  }

  // Easy Just Trash
  List<ObstacleData> level1() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
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

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.binRecycle,
      item2: ObstacleType.binTrash,
      item3: ObstacleType.binRecycle,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binRecycle,
    ));

    return level;
  }

  // Water Introduced
  List<ObstacleData> level2() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
      item2: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item1: ObstacleType.water,
      item3: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item1: ObstacleType.trash,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item1: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item2: ObstacleType.binTrash,
      item4: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.water,
      item2: ObstacleType.trash,
      item3: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.binRecycle,
      item2: ObstacleType.binTrash,
      item3: ObstacleType.binTrash,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binRecycle,
    ));

    return level;
  }

  // Fire Introduced
  List<ObstacleData> level3() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item3: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item1: ObstacleType.water,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item2: ObstacleType.water,
      item3: ObstacleType.fire,
      item4: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item1: ObstacleType.binTrash,
      item2: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item3: ObstacleType.fire,
      item4: ObstacleType.water,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.fire,
      item4: ObstacleType.fire,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 13,
      item3: ObstacleType.binTrash,
      item4: ObstacleType.binRecycle,
      item5: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 14,
      item2: ObstacleType.binRecycle,
    ));

    return level;
  }

  // Turtle Introduced
  List<ObstacleData> level4() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.fire,
      item2: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item1: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item2: ObstacleType.fire,
      item4: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item1: ObstacleType.water,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item1: ObstacleType.binTrash,
      item3: ObstacleType.fire,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.binTrash,
      item2: ObstacleType.binTrash,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.trash,
      item2: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item1: ObstacleType.trash,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.trash,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
      item4: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.fire,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item4: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 13,
      item1: ObstacleType.fire,
      item4: ObstacleType.fire,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 14,
      item1: ObstacleType.fire,
      item3: ObstacleType.binRecycle,
      item5: ObstacleType.fire,
    ));

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
