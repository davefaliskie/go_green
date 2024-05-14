import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_green/local_data/hive_repository.dart';

class MuteButton extends ConsumerStatefulWidget {
  const MuteButton({
    super.key,
    this.currentSong,
  });

  // currentSong is the song file for the background song to play on unMute
  final String? currentSong;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MuteButtonState();
}

class _MuteButtonState extends ConsumerState<MuteButton> {
  @override
  Widget build(BuildContext context) {
    bool playSound = ref.watch(canPlaySoundProvider);

    return IconButton(
      onPressed: () {
        if (playSound == true) {
          // we will now mute
          FlameAudio.bgm.stop();
        } else {
          // we will now play
          if (widget.currentSong != null) {
            FlameAudio.bgm.initialize();
            FlameAudio.bgm.play(widget.currentSong!, volume: 0.1);
          }
        }

        ref.read(canPlaySoundProvider.notifier).toggle();
      },
      icon: playSound
          ? const Icon(Icons.music_note_rounded)
          : const Icon(Icons.music_off_rounded),
    );
  }
}
