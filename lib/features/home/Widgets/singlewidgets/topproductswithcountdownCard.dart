import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'categorybuttonwidget.dart';

Widget topProductwithtime({
  required name,
  required image,
  required miniButtonword,
  required Color miniButtoncolor,
  required color,
  required digitDays,
  required digitHours,
  required digitMinutes,
  required digitSeconds,
  required var mobile,
  required var tablet,
}) {
  return Container(
    height: mobile ? 28.5.h : 22.h,
    width: mobile ? 45.w : 30.w,
    // margin: EdgeInsets.only(
    //     top: 0.5.h, left:mobile?0.5.w:0, right: 1.h, bottom: 0.5.h),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(36, 38, 68, 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
  
        Positioned(
          top: mobile ? 3.h : 1.5.h,
          left: mobile ? 4.w : 3.w,
          right: mobile ? 3.5.w : 1.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: mobile ? 2.h : 1.5.h,
                width: mobile ? 9.5.w : 5.w,
                decoration: BoxDecoration(
                  color: miniButtoncolor,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Center(
                  child: Text(
                    miniButtonword,
                    style: TextStyle(
                      color: color,
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
                child: Image.asset('assets/heart (3).png',
                fit: BoxFit.contain),
              ),
            ],
          ),
        ),
        Positioned(
          top: mobile ? 3.5.h : 1.5.h,
          left: mobile ? 10.w : 3.w,
          child: Center(child: Image.asset(image, width: mobile ? 25.w : 16.w)),
        ),
        Positioned(
          top: mobile
              ? (30.h - 3.h) / 2
              : 10.h, // Center vertically within the parent height
          left: mobile
              ? (45.w - 30.w) / 2
              : 3.w, // Center horizontally within the parent width
          child: Container(
            height: mobile ? 2.5.h : 1.7.h,
            width: mobile ? 27.w : 16.w,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 175, 0, 1),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Center(
              child: textwidget(
                text:
                    "${digitDays}d ${digitHours}h ${digitMinutes}m ${digitSeconds}s",
                fontszie: mobile ? 13.5.sp : 12.sp,
                fonweight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: mobile ? 17.5.h : 13.5.h,
          left: mobile ? 3.3.w : 3.w,
          child: regularfont(
            text: name,
            fontsize: mobile?16.sp:15.5.sp,
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
                "\$7.99",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mobile ? 18.sp : 15.5.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$15",
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
          bottom: mobile ? 2.5.h : 1.5.h,
          left: 3.3.w,
          right: mobile ? 5.w : 3.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: mobile ? 0.7.w : 0.3.w),
                    child: Image.asset(
                      'assets/star.png',
                      height: mobile ? 2.5.h : 2.h,
                      width: mobile ? 2.5.w : 1.5.w,
                    ),
                  );
                }),
              ),
              Container(
               height: mobile ? 4.h : 2.5.h,
                width: mobile
                    ? 4.h
                    : 2.5.h, // Use 4.h for both dimensions to maintain the circle
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
