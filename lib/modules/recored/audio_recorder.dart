import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:record/record.dart';
import 'package:requset/shared/components/components.dart';

class AudioRecorder extends StatefulWidget {
  final void Function(String path) onStop;

  AudioRecorder({
    Key key,
    @required this.onStop,
  }) : super(key: key);

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;

  Timer _timer;
  Timer _ampTimer;
  Amplitude _amplitude;

  final _audioRecorder = Record();

  @override
  void initState() {
    _isRecording = false;
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AvatarGlow(
              animate: _isRecording,
              endRadius: 30.0,
              showTwoGlows: true,
              curve: Curves.easeInOutQuint,
              duration: Duration(milliseconds: 2000),
              repeatPauseDuration: Duration(milliseconds: 100),
              repeat: true,
              glowColor: Theme.of(context).primaryColor,
              child: GestureDetector(
                child: Icon(
                  Icons.mic,
                  color: Colors.blue,
                  size: 28,
                ),
                onLongPress: _start,
                onLongPressUp: _stop,
                onLongPressCancel: () {
                  showToast(
                    text: 'Click at length',
                    state: ToastStates.WARNING,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // Widget _buildTimer() {
  //   final String minutes = _formatNumber(_recordDuration ~/ 60);
  //   final String seconds = _formatNumber(_recordDuration % 60);
  //
  //   return Text(
  //     '$minutes : $seconds',
  //     style: TextStyle(color: Colors.red),
  //   );
  // }
  //
  // String _formatNumber(int number) {
  //   String numberStr = number.toString();
  //   if (number < 10) {
  //     numberStr = '0' + numberStr;
  //   }
  //
  //   return numberStr;
  // }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    final path = await _audioRecorder.stop();

    widget.onStop(path);

    setState(() => _isRecording = false);
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        setState(() => _recordDuration++);
      },
    );

    _ampTimer = Timer.periodic(
      const Duration(milliseconds: 200),
      (Timer t) async {
        _amplitude = await _audioRecorder.getAmplitude();
        setState(() {});
      },
    );
  }
}
