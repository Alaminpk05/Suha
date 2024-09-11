import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/productproductlist.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CycloneOfferWidget extends StatelessWidget {
  const CycloneOfferWidget({
    super.key,
    required this.value,
    required this.asset,
    required this.title,
  });
  final String? asset;
  final String? title;
  final double value;

  @override
  Widget build(BuildContext context) {
    var Tablet = ResponsiveHelper.isTablet(context);
    var Mobile = ResponsiveHelper.isMobile(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductList()));
      },
      child: Container(
        
          height: Mobile?22.h:18.h,
          width: 30.w,
          margin: EdgeInsets.only(
              top: 0.5.h, left: 0.5.w, 
              right: 0.65.h, bottom: 0.5.h),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(36, 38, 68, 1),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(
              left: 1.9.w, right: 1.9.w, bottom: 2.h, top: Mobile?2.3.h:0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                asset!,
                width: 22.w,
              )),
              SizedBox(
                height: 1.2.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.5.w),
                    child: Text(
                      title!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Row(children: [
                      Text(
                        "\$7.99",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 1.w),
                      Center(
                        child: Text(
                          "\$15",
                          style: TextStyle(
                            color: const Color.fromRGBO(116, 119, 148, 1),
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                const Color.fromRGBO(116, 119, 148, 1),
                            decorationThickness: 0.3.h,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " ${(value * 100).toStringAsFixed(0)}% Sold",
                        style: TextStyle(
                          color: const Color.fromRGBO(116, 119, 148, 1),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      LinearPercentIndicator(
                        barRadius: Radius.circular(25.sp),
                        padding: EdgeInsets.symmetric(horizontal: 1.1.w),
                        lineHeight: 0.5.h,
                        percent: value,
                        progressColor: const Color.fromRGBO(13, 110, 253, 1),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
