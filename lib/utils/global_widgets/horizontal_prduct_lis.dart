import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant.dart';



class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({
    super.key,
    required this.mobile,
  });

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 60.w,
          height: 4.h,
          color: const Color.fromRGBO(12, 21, 59, 1),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
         
            itemBuilder: (contex, index) {
              var infiniteIndex = index % horizontalProductList.length;
              var item=horizontalProductList[infiniteIndex];
              return Container(
                margin: EdgeInsets.only(right: 1.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: const Color.fromRGBO(51, 40, 88, 1),
                ),
                width: 23.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3.5.h,
                      width: 4.w,
                      child: Image.asset(
                       item['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 0.7.w,
                    ),
                    textwidget(
                        text:item['text'],
                        fontszie: 13.5.sp,
                        fonweight: FontWeight.w700,
                        color: Colors.white),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 5.w,
        ),

        ///FILTER LIST WIDGET
        Flexible(
          child: PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.sp)),
            color: const Color.fromRGBO(51, 40, 88, 1),
            offset: mobile ? const Offset(0, 38) : const Offset(0, 67),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'short by',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Short By',
                          fontszie: 15.sp,
                          fonweight: FontWeight.w400,
                          color: const Color.fromRGBO(116, 119, 148, 1))),
                ),
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'newest',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Newest',
                          fontszie: 15.sp,
                          fonweight: FontWeight.w400,
                          color: const Color.fromRGBO(116, 119, 148, 1))),
                ),
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'popular',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Popular',
                          fontszie: 15.sp,
                          fonweight: FontWeight.w400,
                          color: const Color.fromRGBO(116, 119, 148, 1))),
                ),
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'ratings',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Ratings',
                          fontszie: 15.sp,
                          fonweight: FontWeight.w400,
                          color: const Color.fromRGBO(116, 119, 148, 1))),
                ),
              ];
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              width: 22.w,
              height: 4.h,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(51, 40, 88, 1),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textwidget(
                        text: 'Short By',
                        fontszie: 13.5.sp,
                        fonweight: FontWeight.w500,
                        color: const Color.fromRGBO(116, 119, 148, 1)),
                    SizedBox(
                      width: 0.5.w,
                    ),
                    SizedBox(
                        height: 5.h,
                        width: 3.w,
                        child: Image.asset(
                          'assets/chevron-down.png',
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}