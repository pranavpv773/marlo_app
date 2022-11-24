import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teams",
        ),
        actions: const [
          Icon(
            Icons.search,
          )
        ],
      ),
    );
  }
}
