import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'categorybuttonwidget.dart';

Widget topProductwithouttime({required String name,required String photo,required Color color,required String minibuttonword2}) {

  return Expanded(
    child: Stack(
      children: [
        Container(
          height: 30.h,
          width: 45.w,
          margin: EdgeInsets.only(top: 0.5.h, left: 0.5.w, right: 1.h, bottom: 0.5.h),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(36, 38, 68, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 3.h,
          left: 6.w,
          child: Center(child: Image.asset(photo, width: 28.w)),
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
                  color: color,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Center(
                  child: Text(
                    minibuttonword2,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "PlusJakartaSans-Regular.ttf",
                      fontSize: 13.5.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
                width: 10.w,
                child: Padding(
                  padding: EdgeInsets.only(right: 0.7.w
                  ),
                  child: Image.asset('assets/heart (3).png', height: 2.5.h,width: 2.5.w
                    ,),
                ),
              ),
            ],
          ),
        ),
    
    
    
        Positioned(
          top: 17.h,
          left: 3.w,
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
                "\$74",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$99",
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
                  return Image.asset(
                    'assets/star.png',
                    height: 2.5.h,
                    width: 2.5.w,
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
                child: Center(child: Image.asset('assets/plus.png',height: 2.h,width: 2.h,)),
              ),
            ],
          ),
        ),
      ],
    ),
  );


}