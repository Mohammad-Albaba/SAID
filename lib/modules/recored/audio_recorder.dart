import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:requset/shared/styles/colors.dart';

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
            _buildRecordStopControl(),
            SizedBox(width: 20),
            _buildPauseResumeControl(),
            //SizedBox(width: 20),
            // _buildText(),
          ],
        );
      },
    );
  }

  Widget _buildRecordStopControl() {
    Icon icon;

    if (_isRecording || _isPaused) {
      icon = const Icon(Icons.stop, color: ColorSecodaryIcon, size: 30);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: Colors.blue, size: 30);
    }

    return ClipOval(
      child: Material(
        child: InkWell(
          child: Container(
            width: 25,
            height: 30,
            child: icon,
            color: Colors.white,
          ),
          onTap: () {
            _isRecording ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (!_isRecording && !_isPaused) {
      return const SizedBox.shrink();
    }

    Icon icon;

    if (!_isPaused) {
      icon = const Icon(Icons.pause, color: ColorSecodaryIcon, size: 30);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: ColorSecodaryIcon, size: 30);
    }

    return ClipOval(
      child: Material(
        child: InkWell(
          child: Container(
            width: 56,
            height: 56,
            child: icon,
            color: Colors.white,
          ),
          onTap: () {
            _isPaused ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

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

  Future<void> _pause() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    await _audioRecorder.pause();

    setState(() => _isPaused = true);
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();

    setState(() => _isPaused = false);
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
