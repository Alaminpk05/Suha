import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../singlewidgets/textwidget.dart';


class DiscountSection extends StatelessWidget {
  const DiscountSection({
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
            Color(0xFFDC3545), // Dark red color
            Color(0xFFFF5B5E), // Lighter reddish-pink color
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
          Positioned(
            top: 5.h,
            right: -1.5.w,
            bottom:0.h,
            child: Image.asset(
              'assets/make-up.png', // Your image path here
              height: 18.h,
              width: 20.w,
              fit: BoxFit.contain,

            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textwidget(text: "20% discount on\nwomen care items.",
                    fontszie: 19.5.sp,
                    fonweight: FontWeight.w600,
                    color: Colors.white),
                SizedBox(height: 0.4.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(

                    backgroundColor: const Color.fromRGBO(98,90,250,1), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp), // Button corners
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text(
                    'Grab this offer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}