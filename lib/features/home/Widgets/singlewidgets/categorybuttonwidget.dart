import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? ontap;
  const CategoryWidget({
    super.key,
    required this.image,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    var Tablet = ResponsiveHelper.isTablet(context);
    var mobile = ResponsiveHelper.isMobile(context);
    return GestureDetector(
      onTap: ontap,
      child: Center(
        child: Container(
          height: mobile ? 14.h : 1.h,
          width: mobile ? 22.w : 16.4.w,
          decoration: BoxDecoration(
              color:Color.fromRGBO(226, 248, 251, 1),
              // const Color.fromRGBO(36, 38, 68, 1),
              borderRadius: BorderRadius.circular(12.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Tablet ? 2.h : 0,
                ),
                child: Image.asset(
                  image,
                  height: mobile ? 8.h : 4.5.h,
                  width: mobile ? 10.5.w : 10.5.w,
                ),
              ),
              SizedBox(
                height: mobile ? 0 : 0.7.h,
              ),
              regularfont(
                text: text,
                fontsize: mobile ? 15.sp : 13.3.sp,
                color:Colors.black 
                // const Color.fromRGBO(116, 119, 148, 0.8),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class regularfont extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  const regularfont({
    super.key,
    required this.text,
    required this.fontsize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontFamily: "PlusJakartaSans-Regular.ttf",
          fontSize: fontsize),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}
