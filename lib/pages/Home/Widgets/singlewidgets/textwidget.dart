import 'package:flutter/cupertino.dart';

class textwidget extends StatelessWidget {
  final String text;
  final double fontszie;
  final FontWeight fonweight;
  final Color color;
  const textwidget({
    super.key, required this.text,
    required this.fontszie,
    required this.fonweight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontWeight: fonweight,
      color: color,
      fontSize: fontszie,
    ));
  }
}