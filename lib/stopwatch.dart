import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
    _timer.cancel();
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
    });
  }

  String _formattedTime() {
    final milliseconds = _stopwatch.elapsedMilliseconds;
    final minutes = (milliseconds ~/ 60000).toString().padLeft(2, '0');
    final seconds = ((milliseconds % 60000) ~/ 1000).toString().padLeft(2, '0');
    final hundredths = ((milliseconds % 1000) ~/ 10).toString().padLeft(2, '0');
    return "$minutes:$seconds.$hundredths";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formattedTime(),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: _stopwatch.isRunning ? _stopStopwatch : _startStopwatch,
                    child: Text(
                      _stopwatch.isRunning ? 'Stop' : 'Start',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: _resetStopwatch,
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
