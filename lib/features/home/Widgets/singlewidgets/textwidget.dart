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
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text, style: TextStyle(
        
        fontFamily: 'Poppins',
        fontWeight: fonweight,
        color: color,
        fontSize: fontszie,
        
      )),
    );
  }
}

// class textspane extends StatelessWidget {
//   final String text;
//   final double fontszie;
//   final FontWeight fonweight;
//   final Color color;
//    textspane({
//     super.key, required this.text,
//     required this.fontszie,
//     required this.fonweight,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextSpan(text: text, style: TextStyle(
//       fontWeight: fonweight,
//       color: color,
//       fontSize: fontszie,
//     ));
//   }
// }