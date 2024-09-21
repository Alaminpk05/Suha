import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/categorybuttonwidget.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';

class PagesTitleText extends StatelessWidget {
  const PagesTitleText({
    super.key,
    required this.title,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
  });
  final String title;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.2.h),
      child: textwidget(
          text: title, fontszie: fontsize, fonweight: fontWeight, color: color),
    );
  }
}

class ElevatedIconTextButton extends StatelessWidget {
  const ElevatedIconTextButton({
    super.key,
    required this.mobile,
    required this.ontap,
    required this.title,
  });
  final void Function()? ontap;

  final bool mobile;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.3.h),
      height: 5.h,
      width: 90.w,
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(51, 40, 88, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              regularfont(
                  text: title,
                  fontsize: mobile ? 15.sp : 13.5.sp,
                  color: Colors.white),
              SizedBox(
                width: mobile ? 2.w : 1.w,
              ),
              Image.asset(
                'assets/arrow-right2.png',
                height: 3.h,
                width: mobile ? 4.w : 2.5.w,
              )
            ],
          )),
    );
  }
}
