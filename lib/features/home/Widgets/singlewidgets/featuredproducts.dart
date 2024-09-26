import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class FeaturedProducts extends StatelessWidget {
  final String image;
  final String title;
  final String newprice;
  final String oldprice;
  final void Function()? ontap;
  const FeaturedProducts({
    super.key,
    required this.image,
    required this.title,
    required this.newprice,
    required this.oldprice,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    var Mobile = ResponsiveHelper.isMobile(context);

    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 20.h,
          width: Mobile ? 29.w : 30.w,
          margin: EdgeInsets.only(
              top: .5.h,
              left: Mobile ? 0.5.w : 0,
              right: Mobile ? 0.5.h : 0,
              bottom: 0.5.h),
          padding: EdgeInsets.only(right: 0.5.w),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(36, 38, 68, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                        child: SizedBox(
                      height: Mobile ? 9.h : 8.5.h,
                      width: Mobile ? 30.w : 28.w,
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                      ),
                    )),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Mobile ? 4.w : 3.w,
                          right: Mobile ? 3.5.w : 2.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Mobile ? 16.5.sp : 14.5.sp,
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(children: [
                            Text(
                              newprice.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 1.w),
                            Center(
                              child: Text(
                                oldprice.toString(),
                                style: TextStyle(
                                  color:
                                      const Color.fromRGBO(116, 119, 148, 1),
                                  fontSize: Mobile ? 16.sp : 15.sp,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: Mobile ? 2.w : 0.6.w,
                top: Mobile ? 0.7.h : 1.h,
                child: Container(
                  height: 3.h,
                  width: 6.5.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/circle.png',
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Positioned(
                left: Mobile ? 3.7.w : 2.3.w,
                top: Mobile ? 1.5.h : 1.8.h,
                child: Container(
                  height: 1.4.h,
                  width: 3.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/star (1).png',
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
