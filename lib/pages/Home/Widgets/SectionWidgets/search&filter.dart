import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Search_Filter extends StatelessWidget {
  const Search_Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var Tablet = ResponsiveHelper.isTablet(context);
    var Mobile = ResponsiveHelper.isMobile(context);

    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(top: homeTopPad, left: homeMobLP, right:homeMobRP)
          : EdgeInsets.only(top: homeTopPad, left: homeTabLP, right: homeTabRP),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              height: Mobile?5.50.h:5.0.h,
              width: 79.w,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(51, 40, 88, 1),
                  borderRadius: BorderRadius.circular(13.sp)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/search.png',
                      height: 3.h,
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                        child: TextFormField(
                      onTap: () {},
                      decoration: const InputDecoration(
                          hintText: "Search in Suha",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(153, 172, 148, 0.7)),
                          border: InputBorder.none),
                    ))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: ResponsiveHelper.isTablet(context) ? 2.w : 3.w,
          ),
          Expanded(
            child: Container(
              width: 27.sp,
              height: 5.h,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(11, 94, 217, 1),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/adjustments-horizontal (1).png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
