import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/productproductlist.dart';
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
       
          height: Mobile?22.h:24.h,
          width: Mobile?30.w:22.w,
          margin: EdgeInsets.only(
              top: Mobile?0.5.h:2.h, left: Mobile?0.5.w:0.3.w,
              right: 0.65.h, bottom: Mobile?0.h:3.h),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(36, 38, 68, 1),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(
             bottom: Mobile?0.h:0.h, top: Mobile?2.3.h:3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 0.5.w),
                child: Center(
                    child: Image.asset(
                  asset!,
                  fit: BoxFit.contain,
                 
                  width: Mobile?22.w:null,
                )),
              ),
              SizedBox(
                height: Mobile?1.2.h:2.2.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:2.5.w),
                  child: Column(

                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Mobile?16.sp:14.sp,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(children: [
                        Text(
                          "\$7.99",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Mobile?16.sp:14.sp,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 1.w),
                        Center(
                          child: Text(
                            "\$15",
                            style: TextStyle(
                              color: const Color.fromRGBO(116, 119, 148, 1),
                              fontSize: Mobile?15.5.sp:13.5.sp,
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
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${(value * 100).toStringAsFixed(0)}% Sold",
                            style: TextStyle(
                              color: const Color.fromRGBO(116, 119, 148, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          LinearPercentIndicator(
                            barRadius: Radius.circular(25.sp),
                            padding: EdgeInsets.symmetric(horizontal: Mobile?0.6.w:0),
                            lineHeight: 0.5.h,
                            percent: value,
                            progressColor: const Color.fromRGBO(13, 110, 253, 1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
