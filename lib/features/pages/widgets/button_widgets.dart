import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/categorybuttonwidget.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';

class PagesTitleText extends StatelessWidget {
  const PagesTitleText({
    super.key,
    required this.title,
    required this.fontsize,
    required this.fontWeight,

  });
  final String title;
  final double fontsize;
  final FontWeight fontWeight;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.4.h),
      child: textwidget(
          text: title, fontszie: fontsize, fonweight: fontWeight, color:productsHeaderColor),
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
              backgroundColor: productColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              regularfont(
                  text: title,
                  fontsize: mobile ? 15.sp : 13.5.sp,
                  color: textColor),
              SizedBox(
                width: mobile ? 2.w : 1.w,
              ),
              Image.asset(
                'assets/arrow-right2.png',
                color: textColor,
                height: 3.h,
                width: mobile ? 4.w : 2.5.w,
              )
            ],
          )),
    );
  }
}
