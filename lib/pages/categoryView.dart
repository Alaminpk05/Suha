import 'package:flutter/material.dart';

class Categoryview extends StatelessWidget {
  final String title;
  const Categoryview({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),

    );
  }
}
