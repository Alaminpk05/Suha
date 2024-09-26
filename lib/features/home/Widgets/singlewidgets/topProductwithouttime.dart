import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
}) {
  return Container(
    height: mobile ? 28.5.h : 22.h,
    width: width,
    // margin: EdgeInsets.only(
    //     top: 0.5.h, left: mobile?0.5.w:0, right: 1.h, bottom: 0.5.h),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(36, 38, 68, 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Positioned(
          top: mobile ? 3.h : 2.5.h,
          left: mobile ? 6.w : 1.5.w,
          child:
              Center(child: Image.asset(photo, width: mobile ? 28.w : 16.5.w)),
        ),
        Positioned(
          top: mobile ? 3.h : 1.5.h,
          left: mobile ? 4.w : 2.5.w,
          right: mobile ? 3.5.w : -2.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: mobile ? 2.h : 1.5.h,
                width: mobile ? 9.5.w : 5.w,
                decoration: BoxDecoration(
                  color: minibuttoncolor,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Center(
                  child: Text(
                    minibuttonword2,
                    style: TextStyle(
                      color: textcolor,
                      fontWeight: FontWeight.w500,
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
          left: mobile ? 3.3.w : 3.w,
          child: regularfont(
            text: name,
            fontsize: mobile ? 16.sp : 15.5.sp,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: mobile ? 20.2.h : 16.h,
          left: 3.3.w,
          right: 2.w,
          child: Row(
            children: [
              Text(
                "\$74",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mobile ? 18.sp : 15.5.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$99",
                style: TextStyle(
                  color: const Color.fromRGBO(116, 119, 148, 1),
                  fontSize: mobile ? 15.5.sp : 13.5.sp,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: const Color.fromRGBO(116, 119, 148, 1),
                  decorationThickness: 0.3.h,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: mobile ? 2.h : 1.5.h,
          left: 3.3.w,
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
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: Image.asset(
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
  );
}
