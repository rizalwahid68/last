import 'package:flutter/material.dart';

class Notepad extends StatefulWidget {
  const Notepad({super.key});

  @override
  _NotepadState createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notepad'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            hintText: 'Tulis catatan Anda di sini...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
