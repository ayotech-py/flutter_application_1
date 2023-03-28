import 'dart:math';

import 'package:flutter/material.dart';

class Generator extends StatefulWidget {
  Generator({super.key, required this.min, required this.max});

  int min, max;

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  int? _generate;
  final random_num = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generator'),
      ),
      body: Center(
          child: Text(
        _generate?.toString() ?? 'Generate a Number',
        style: const TextStyle(fontSize: 40),
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          setState(() {
            _generate =
                widget.min + random_num.nextInt(widget.max + 1 - widget.min);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
