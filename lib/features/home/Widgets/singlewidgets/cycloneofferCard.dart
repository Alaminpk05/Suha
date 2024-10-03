import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/product_details/page/page_details.dart';
import 'package:shuhaui/utils/constant/colors.dart';

import 'package:shuhaui/utils/respnsive_helper.dart';

class CycloneOfferWidget extends StatelessWidget {
  const CycloneOfferWidget({
    super.key,
    required this.value,
    required this.asset,
    required this.title,
  });
  final String asset;
  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return GestureDetector(
      onTap: () {

        
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  PageDetails(image: asset, title: title,)));
      },
      child: Container(
          // height: mobile?23.h:12.h,
          // width: mobile?30.w:22.w,
          constraints: BoxConstraints(maxWidth: mobile?30.w:22.w,maxHeight: mobile?23.h:15.h),
         
          decoration: BoxDecoration(
              color:productColor,
              //  const Color.fromRGBO(36, 38, 68, 1),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(
             bottom: mobile?0.h:0.h, top: mobile?0.5.h:0.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 0.5.w),
                child: Center(
                    child: Image.asset(
                  asset,

                 
                  width: mobile?30.w:null,
                )),
              ),
              SizedBox(
                height: mobile?0.h:0.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:2.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                           color: textColor,
                          fontSize: mobile?16.sp:15.sp,
                          fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 0.0.h,
                    ),
                    Row(children: [
                      Text(
                        "\$7.99",
                        style: TextStyle(
                            color: textColor,
                            fontSize: mobile?16.sp:14.sp,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 1.w),
                      Center(
                        child: Text(
                          "\$15",
                          style: TextStyle(
                            color: textColor,
                            fontSize: mobile?15.5.sp:13.5.sp,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            // decorationColor: const Color.fromRGBO(116, 119, 148, 1),
                            decorationThickness: 0.3.h,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 0.0.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${(value * 100).toStringAsFixed(0)}% Sold",
                          style: TextStyle(
                             color:textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        LinearPercentIndicator(
                          barRadius: Radius.circular(25.sp),
                          padding: EdgeInsets.symmetric(horizontal: mobile?0.6.w:0),
                          lineHeight: 0.5.h,
                          percent: value,
                          progressColor:productSoldColor,
                          //  const Color.fromRGBO(13, 110, 253, 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
