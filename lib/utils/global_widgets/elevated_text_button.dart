import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';

class ElevatedTextButton extends StatelessWidget {
  const ElevatedTextButton({
    super.key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.height,
    required this.width, required this.radius,
  });

  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(98, 90, 250, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: textwidget(
            text: text,
            fontszie: fontsize,
            fonweight: fontWeight,
            color: const Color.fromRGBO(255, 255, 255, 0.98),
          )),
    );
  }
}
