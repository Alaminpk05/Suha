import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../singlewidgets/textwidget.dart';


class DiscountSection2 extends StatelessWidget {
  const DiscountSection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:20.h,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(17, 92, 211,1),
            Color.fromRGBO(40, 91, 222,1),
            Color.fromRGBO(74,90 ,238,1),
            Color.fromRGBO(97,90 ,250,1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        // Background color matching the image
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Stack(
        children: [
          // Positioned for the brush image on the right
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  height: 8.5.h,
                  width: 30.w
                  ,
                  child: Image.asset(
                    'assets/discount.png', // Your image path here
                    fit: BoxFit.contain,

                  ),
                ),
                Flexible(
                  child: RichText(

                    softWrap: true,
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                    children:[
                      textspan(text:"Get20% dicount!\n",
                          fontsize: 21.sp,
                          color: Colors.white,
                          fontweight: FontWeight.w700),
                      WidgetSpan(child: SizedBox(height: 3.h,)),

                      textspan(text: 'To get discount,enter\nthe',
                          fontsize: 16.5.sp, color: Colors.white,
                          fontweight: FontWeight.w400),
                      textspan(text:" Get20 ", fontsize: 17.sp,
                          color: Colors.white,
                          fontweight: FontWeight.w700),
                      textspan(text: 'code on the checkout page.',
                          fontsize: 16.sp, color: Colors.white,
                          fontweight: FontWeight.w400),
                    ]
                  )),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }

  TextSpan textspan({required String text,required double fontsize,required Color color,required FontWeight fontweight}) {
    return TextSpan(
      spellOut: true,
      text:text,
      style: TextStyle(overflow: TextOverflow.visible,
                      fontSize: fontsize,
                      fontWeight:fontweight,
                      color: Colors.white),
    );
  }
}