import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_green/local_data/hive_repository.dart';
import 'package:go_green/router.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final db = ref.read(hiveRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Main Menu",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Attempts: ${db.getValue("totalAttempts")}"),
            Text("Trash: ${db.getValue("trashEndCount")}"),
            Text("Water: ${db.getValue("waterEndCount")}"),
            Text("Fire: ${db.getValue("fireEndCount")}"),
            Text("Recycle: ${db.getValue("recycleEndCount")}"),
            ElevatedButton(
              onPressed: () {
                // play game
                context.goNamed(AppRoute.game.name);
              },
              child: const Text("Start Game"),
            )
          ],
        ),
      ),
    );
  }
}
