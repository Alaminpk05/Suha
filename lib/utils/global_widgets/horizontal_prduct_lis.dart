import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class HorizontalProductList extends StatefulWidget {
  const HorizontalProductList({
    super.key,
    required this.mobile,
  });

  final bool mobile;

  @override
  State<HorizontalProductList> createState() => _HorizontalProductListState();
}

class _HorizontalProductListState extends State<HorizontalProductList> {
  var selected = '';
  bool isopen = false;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: mobile?60.w:45.w,
          height: 4.h,
          color: scaffoldColor,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (contex, index) {
              var infiniteIndex = index % horizontalProductList.length;
              var item = horizontalProductList[infiniteIndex];
              return Container(
                margin: EdgeInsets.only(right: 1.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: Color.fromRGBO(226, 248, 251, 1),
                ),
                width: mobile?23.w:18.w,
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
                        text: item['text'],
                        fontszie: 13.5.sp,
                        fonweight: FontWeight.w700,
                        color: textColor),
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
            onOpened: () {
              setState(() {
                isopen = true;
              });
            },
            onCanceled: () {
              setState(() {
                isopen = false;
              });
            },
            onSelected: (value) {
              print(selected);

              setState(() {
                selected = value;
                isopen = false;
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.sp)),
            color:productColor,
            offset: widget.mobile ? const Offset(0, 38) : const Offset(0, 67),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'Short By',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Short By',
                          fontszie: 15.sp,
                          fonweight: FontWeight.w600,
                          color: textColor)),
                ),
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'Newest',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Newest',
                          fontszie: 15.sp,
                          fonweight: selected == 'Newest'
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: selected == 'Newest'
                              ? textColor
                              : grayColor)),
                ),
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'Popular',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Popular',
                          fontszie: 15.sp,
                          fonweight: selected == 'Popular'
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: selected == 'Popular'
                              ? textColor
                              : grayColor)),
                ),
                PopupMenuItem<String>(
                  height: 4.h,
                  value: 'Ratings',
                  child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: textwidget(
                          text: 'Ratings',
                          fontszie: 15.sp,
                          fonweight: selected == 'Ratings'
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: selected == 'Ratings'
                              ? textColor
                              : grayColor)),
                ),
              ];
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: mobile?1.w:0.w),
              width: mobile?22.w:16.w,
              height: 4.h,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 248, 251, 1),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textwidget(
                        text: selected == '' ? 'Short By' : selected,
                        fontszie: 13.5.sp,
                        fonweight: FontWeight.w500,
                        color: textColor,),
                    SizedBox(
                      width: 0.5.w,
                    ),
                    SizedBox(
                        height: 5.h,
                        width: mobile?3.w:2.5.w,
                        child: isopen == true
                            ? Image.asset(
                                'assets/chevron-down.png',
                                color: textColor,
                                fit: BoxFit.contain,
                              )
                            : Image.asset(
                                'assets/chevron-up.png',
                                color: textColor,
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
