import 'dart:async';

import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:requset/shared/styles/colors.dart';

class AudioPlayer extends StatefulWidget {
  final ap.AudioSource source;
  final VoidCallback onDelete;

  const AudioPlayer({
    @required this.source,
    @required this.onDelete,
  });

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  static const double _controlSize = 56;
  static const double _deleteBtnSize = 24;

  final _audioPlayer = ap.AudioPlayer();

  StreamSubscription<ap.PlayerState> _playerStateChangedSubscription;
  StreamSubscription<Duration> _durationChangedSubscription;
  StreamSubscription<Duration> _positionChangedSubscription;

  @override
  void initState() {
    _playerStateChangedSubscription =
        _audioPlayer.playerStateStream.listen((state) async {
      if (state.processingState == ap.ProcessingState.completed) {
        await stop();
      }
      setState(() {});
    });
    _positionChangedSubscription =
        _audioPlayer.positionStream.listen((position) => setState(() {}));
    _durationChangedSubscription =
        _audioPlayer.durationStream.listen((duration) => setState(() {}));
    _init();

    super.initState();
  }

  Future<void> _init() async {
    await _audioPlayer.setAudioSource(widget.source);
  }

  @override
  void dispose() {
    _playerStateChangedSubscription.cancel();
    _positionChangedSubscription.cancel();
    _durationChangedSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildControl(),
            _buildSlider(constraints.maxWidth),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Color(0xFF73748D),
                size: _deleteBtnSize,
              ),
              onPressed: () {
                _audioPlayer.stop().then(
                      (value) => widget.onDelete(),
                    );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildControl() {
    Icon icon;
    Color color;

    if (_audioPlayer.playerState.playing) {
      icon = Icon(
        Icons.pause,
        color: ColorSecodaryIcon,
        size: 30,
      );
    } else {
      final theme = Theme.of(context);
      icon = Icon(
        Icons.play_arrow,
        color: ColorSecodaryIcon,
        size: 30,
      );
    }

    return ClipOval(
      child: Material(
        color: Colors.white,
        child: IconButton(
          icon: icon,
          onPressed: () {
            if (_audioPlayer.playerState.playing) {
              pause();
            } else {
              play();
            }
          },
        ),
        // child: InkWell(
        //   child: icon,
        //   onTap: () {
        //     if (_audioPlayer.playerState.playing) {
        //       pause();
        //     } else {
        //       play();
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget _buildSlider(double widgetWidth) {
    final position = _audioPlayer.position;
    final duration = _audioPlayer.duration;
    bool canSetValue = false;
    if (duration != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    double width = widgetWidth - _controlSize - _deleteBtnSize;
    width -= _deleteBtnSize;

    return SizedBox(
      width: width,
      // child: Slider(
      //   activeColor: Theme.of(context).primaryColor,
      //   inactiveColor: Theme.of(context).accentColor,
      //   onChanged: (v) {
      //     if (duration != null) {
      //       final position = v * duration.inMilliseconds;
      //       _audioPlayer.seek(Duration(milliseconds: position.round()));
      //     }
      //   },
      //   value: canSetValue && duration != null
      //       ? position.inMilliseconds / duration.inMilliseconds
      //       : 0.0,
      // ),

      child: AudioWave(
        width: width,
        height: 25,
        spacing: 2.9,
        animationLoop: 5,
        bars: [
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
          AudioWaveBar(height: 10, color: Colors.green),
          AudioWaveBar(height: 30, color: Colors.green),
          AudioWaveBar(height: 70, color: Colors.green),
          AudioWaveBar(height: 40),
          AudioWaveBar(height: 20, color: Colors.green),
        ],
      ),
    );
  }

  Future<void> play() {
    return _audioPlayer.play();
  }

  Future<void> pause() {
    return _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    return _audioPlayer.seek(const Duration(milliseconds: 0));
  }
}
