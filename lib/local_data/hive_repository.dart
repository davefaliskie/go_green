import 'package:flutter/foundation.dart';
import 'package:go_green/game_end_state.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_repository.g.dart';

class HiveRepository {
  final box = Hive.box("gameData");

  dynamic getValue(String key) {
    return box.get(key);
  }

  void saveAttempt(GameEndState endState) {
    final attempts = box.get("totalAttempts", defaultValue: 0);
    box.put("totalAttempts", attempts + 1);

    final endCounterKey = "${endState.name}EndCount";
    final endCount = box.get(endCounterKey, defaultValue: 0);
    box.put(endCounterKey, endCount + 1);

    debugPrint("Box: ${box.toMap()}");
  }

  int setLevel() {
    final recycleEnd = box.get("recycleEndCount", defaultValue: 0);
    debugPrint("LEVEL: ${(recycleEnd + 1).clamp(1, 5)}");
    return (recycleEnd + 1).clamp(1, 5);
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository(HiveRepositoryRef ref) {
  return HiveRepository();
}
