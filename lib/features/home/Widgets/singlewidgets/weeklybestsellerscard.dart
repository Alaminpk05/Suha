import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class WeeklyProductsCard extends StatelessWidget {
  final String image;
  final String title;

  const WeeklyProductsCard({
    super.key,
    required this.image,
    required this.title, required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: mobile ? 0.w : 0, vertical: 0.5.h),
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color:productColor, // Use the passed container color
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
            height: double.infinity,
            width: mobile ? 25.w : 18.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color:   Color.fromRGBO(24,179,210,1),),
            child: Stack(children: [
              Positioned(
                child: SizedBox(
                  height: 22.h,
                  width: 19.w,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 1.w,
                bottom: 6.1.h,
                child: Container(
                  height: 5.5.h,
                  width: 5.5.w,
                  decoration:  BoxDecoration(

                      shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(8.5.sp),
                    child: Image.asset(
                      icon,
                     
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(width: 2.5.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 1.8.h,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        '\$54',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 1.8.w),
                      const Text(
                        '\$64',
                        style: TextStyle(
                          color: Color(0xFFDC3545),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                   Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "4.88",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        " (125 Reviews",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
