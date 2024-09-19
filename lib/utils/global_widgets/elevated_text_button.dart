// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';

class ElevatedTextButton extends StatelessWidget {
   const ElevatedTextButton({
    super.key,
    required this.text,
    required this.elevation,
    required this.fontsize,
    required this.fontWeight,
    required this.height,
    required this.width,
    required this.radius,
    required this.buttoncolor,
    required this.textcolor,
    required this.ontap
  });
   final void Function()? ontap;
  final String text;
  final double elevation;
  final double fontsize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final double radius;
  final Color buttoncolor;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: buttoncolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: textwidget(
            text: text,
            fontszie: fontsize,
            fonweight: fontWeight,
            color: textcolor,
          )),
    );
  }
}
