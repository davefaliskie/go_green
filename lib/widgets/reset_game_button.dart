import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_green/local_data/hive_repository.dart';
import 'package:go_router/go_router.dart';

class ResetGameButton extends ConsumerWidget {
  const ResetGameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(12.0),
              title: const Text("Reset The Game"),
              content: const Text(
                "Are you sure? You will lose all progress and everything will be reset. This can't be undone.",
                style: TextStyle(fontSize: 18),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("No, Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(hiveRepositoryProvider).resetGame();
                    ref.invalidate(hiveRepositoryProvider);
                    HapticFeedback.mediumImpact();
                    context.pop();
                  },
                  child: const Text(
                    "Yes, Reset Game",
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.restart_alt_rounded),
    );
  }
}
