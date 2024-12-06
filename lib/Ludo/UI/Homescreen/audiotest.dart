// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import '../../../audio.dart';


class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool isPlaying = false;
  bool isNewPlaying = false;
  bool isvibePlaying = false;

  @override
  void initState() {
    super.initState();
    Audio.bgmusic();
    Audio.sound();

  }

  void _togglePlayback() async {
    if (isPlaying) {
      await Audio.audioPlayers.stop();
    } else {
      Audio.bgmusic();
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _NewtogglePlayback() async {
    if (isNewPlaying) {
      await Audio.audioPlayer.stop();
    } else {
      Audio.sound();
    }

    setState(() {
      isNewPlaying = !isNewPlaying;
    });
  }

  void _VibtogglePlayback() async {
    if (isvibePlaying) {
      Vibration.vibrate(duration: 500);
    } else {
      Audio.sound();

    }
    setState(() {
      isvibePlaying = !isvibePlaying;
    });
  }

  @override
  void dispose() {
    Audio.audioPlayers.dispose();
    Audio.audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _togglePlayback,
            child: Text(isPlaying ? "Stop Audio" : "Play Audio"),
          ),
          ElevatedButton(
            onPressed: _NewtogglePlayback,
            child: Text(isNewPlaying ? "Stop Audio" : "Play Audio"),
          ),
          ElevatedButton(
            onPressed: _VibtogglePlayback,
            child: Text(isvibePlaying ? "Stop Audio" : "Play Audio"),
          ),
        ],
      ),
    );
  }
}
