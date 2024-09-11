import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/Home/Widgets/singlewidgets/textwidget.dart';
import 'categorybuttonwidget.dart';

Widget topProductwithtime(
    {required name,
    required image,
    required miniButtonword,
    required Color miniButtoncolor,
    required color,
    required digitDays,
    required digitHours,
    required digitMinutes,
    required digitSeconds,
    }) {
  return Expanded(
    child: Stack(
      children: [
        Container(
          height: 30.h,
          width: 45.w,
          margin:
              EdgeInsets.only(top: 0.5.h, left: 0.5.w, right: 1.h, bottom: 0.5.h),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(36, 38, 68, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 3.h,
          left: 4.w,
          right: 3.5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 2.h,
                width: 9.5.w,
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
                      fontSize: 13.5.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
                width: 10.w,
                child: Image.asset('assets/heart (3).png', fit: BoxFit.contain),
              ),
            ],
          ),
        ),
        Positioned(
          top: 3.5.h,
          left: 10.w,
          child: Center(child: Image.asset(image, width: 25.w)),
        ),
        Positioned(
          top: (30.h - 3.h) / 2, // Center vertically within the parent height
          left: (45.w - 30.w) / 2, // Center horizontally within the parent width
          child: Container(
            height: 2.5.h,
            width: 27.w,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 175, 0, 1),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Center(
              child: textwidget(
                text:
                    "${digitDays}d ${digitHours}h ${digitMinutes}m ${digitSeconds}s",
                fontszie: 13.5.sp,
                fonweight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: 17.h,
          left: 4.w,
          child: regularfont(
            text: name,
            fontsize: 16.sp,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 19.5.h,
          left: 3.w,
          right: 2.w,
          child: Row(
            children: [
              Text(
                "\$7.99",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$15",
                style: TextStyle(
                  color: const Color.fromRGBO(116, 119, 148, 1),
                  fontSize: 15.5.sp,
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
          bottom: 2.h,
          left: 3.3.w,
          right: 5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 0.7.w),
                    child: Image.asset(
                      'assets/star.png',
                      height: 2.5.h,
                      width: 2.5.w,
                    ),
                  );
                }),
              ),
              Container(
                height: 4.h,
                width: 4.h, // Use 4.h for both dimensions to maintain the circle
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: Image.asset(
                  'assets/plus.png',
                  height: 2.h,
                  width: 2.h,
                )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
