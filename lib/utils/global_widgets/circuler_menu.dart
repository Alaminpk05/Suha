import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CircleMenu extends StatelessWidget {
  const CircleMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Container(
      padding: EdgeInsets.only(left: mobile?0:1.w),
      height: mobile ? 4.h : 4.h,
      width: mobile ? 8.w : 5.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromRGBO(
              92, 83, 121, 1), // Border color (outer circle)
          width: mobile?0.5.w:0.4.w, // Width of the outer circle
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLine(mobile ? 4.w : 2.3.w, mobile?2.8.h:0.20.h),
          SizedBox(height: mobile?0.35.h:0.4.h), // Spacing between lines
          _buildLine(mobile?2.w:1.5.w, mobile?2.8.h:0.20.h),
          SizedBox(height: mobile?0.35.h:0.38.h), // Spacing between lines
          _buildLine(mobile?4.w:2.w, mobile?2.8.h:0.20.h),
        ],
      ),
    );
  }
}

Widget _buildLine(double isWidth, double height) {
  return Container(
   
    width: isWidth, // Adjust width of the lines
    height: height, // Thickness of the lines
    color: const Color.fromRGBO(116, 119, 148, 1), // Line color
  );
}
