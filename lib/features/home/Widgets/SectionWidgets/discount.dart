import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';
import '../singlewidgets/textwidget.dart';


class DiscountSection extends StatelessWidget {
  const DiscountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var mobile = ResponsiveHelper.isMobile(context);

    return Container(
      height:mobile?18.h:18.h,
      width: double.infinity,
     
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
            top: mobile?3.h:5.h,
            right: mobile?-0.5.w:-4.8.w,
            bottom:0.3.h,
            child: Image.asset(
              'assets/make-up.png', // Your image path here
              height: mobile?18.h:0.h,
              width: mobile?20.w:20.w,
              fit: BoxFit.contain,
    
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 5.w,right: 16.w,top:2.h,bottom: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textwidget(text: mobile?"20% discount on\nwomen care items.":"20% discount on women care items.",
                    fontszie: mobile?19.5.sp:18.sp,
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