import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

enum PlayerState { stopped, playing, paused }

class AutoPlayQuran extends StatefulWidget {
  final String kUrl;

  const AutoPlayQuran({Key? key, required this.kUrl}) : super(key: key);

  @override
  _AutoPlayQuranState createState() => _AutoPlayQuranState();
}

class _AutoPlayQuranState extends State<AutoPlayQuran> {
  Duration? duration;
  Duration? position;

  late AudioPlayer audioPlayer;

  PlayerState playerState = PlayerState.stopped;

  bool get isPlaying => playerState == PlayerState.playing;
  bool get isPaused => playerState == PlayerState.paused;

  String get durationText => duration != null ? duration!.toString().split('.').first : '';
  String get positionText => position != null ? position!.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription? _positionSubscription;
  StreamSubscription? _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _audioPlayerStateSubscription?.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onPositionChanged.listen((p) {
      setState(() => position = p);
    });

    _audioPlayerStateSubscription = audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == PlayerState.playing) {
        setState(() => duration = audioPlayer.getDuration() as Duration?);
      } else if (s == PlayerState.stopped) {
        onComplete();
        setState(() {
          position = duration;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(UrlSource(widget.kUrl));
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = Duration();
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.setVolume(muted ? 0 : 1);
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildPlayer(widget.kUrl),
    );
  }

  Widget _buildPlayer(String kUrl) {
    return IconButton(
      onPressed: isPlaying ? stop : play,
      iconSize: 25.0,
      icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      color: Colors.white,
    );
  }
}
