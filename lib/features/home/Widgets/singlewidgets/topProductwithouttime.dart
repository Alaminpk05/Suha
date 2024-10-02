import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/product_details/page/page_details.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'categorybuttonwidget.dart';

Widget topProductwithouttime({
  required String name,
  required String photo,
  required Color minibuttoncolor,
  required String minibuttonword2,
  required var mobile,
  required Color textcolor,
  required var tablet,
  required width,
  required context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => PageDetails(image: photo, title: name)));
    },
    child: Container(
      height: mobile ? 28.5.h : 22.h,
      width: width,
      // margin: EdgeInsets.only(
      //     top: 0.5.h, left: mobile?0.5.w:0, right: 1.h, bottom: 0.5.h),
      decoration: BoxDecoration(
        color: productColor,
        //  const Color.fromRGBO(36, 38, 68, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: mobile ? 3.h : 2.5.h,
            left: mobile ? 6.w : 1.5.w,
            child: Center(
                child: Image.asset(photo, width: mobile ? 28.w : 16.5.w)),
          ),
          Positioned(
            top: mobile ? 3.h : 1.5.h,
            left: mobile ? 4.w : 2.5.w,
            right: mobile ? 3.5.w : -2.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.2.h),
                  // height: mobile ? 2.h : 1.5.h,
                  // width: mobile ? 10.w : 5.w,
                  decoration: BoxDecoration(
                    color: miniButtonColor,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Center(
                    child: Text(
                      minibuttonword2,
                      style: TextStyle(
                        color: miniButtonTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "PlusJakartaSans-Regular.ttf",
                        fontSize: mobile ? 13.5.sp : 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                  width: 10.w,
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.7.w),
                    child: Image.asset(
                      'assets/heart (3).png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: mobile ? 17.5.h : 13.5.h,
            left: mobile ? 3.3.w : 2.5.w,
            child: regularfont(
              text: name,
              fontsize: mobile ? 16.sp : 21.px,
              color: textColor,
            ),
          ),
          Positioned(
            top: mobile ? 20.2.h : 15.7.h,
            left: mobile ? 3.3.w : 2.5.w,
            right: 2.w,
            child: Row(
              children: [
                Text(
                  "\$74",
                  style: TextStyle(
                    color: textColor,
                    fontSize: mobile ? 18.sp : 23.px,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 1.w),
                Text(
                  "\$99",
                  style: TextStyle(
                    color: textColor,
                    fontSize: mobile ? 15.5.sp : 13.5.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: textColor,
                    decorationThickness: 0.3.h,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: mobile ? 2.5.h : 1.35.h,
            left: mobile ? 3.3.w : 2.8.w,
            right: mobile ? 5.w : 3.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FiveStar(
                  height: mobile ? 2.5.h : 1.5.h,
                  width: mobile ? 2.5.w : 1.5.w,
                ),
                Container(
                  height: mobile ? 4.h : 2.5.h,
                  width: mobile
                      ? 4.h
                      : 2.5
                          .h, // Use 4.h for both dimensions to maintain the circle
                  decoration: BoxDecoration(
                    color: addButtonColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Image.asset(
                    color: addButtoniconColor,
                    'assets/plus.png',
                    height: mobile ? 2.h : 2.h,
                    width: mobile ? 2.h : 1.5.h,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
