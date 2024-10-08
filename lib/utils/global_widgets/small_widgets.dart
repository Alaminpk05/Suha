import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant/colors.dart';

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.widget, required this.mobile,
  });
  final double height;
  final double width;
  final Widget widget;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
          color: addButtonColor,
          borderRadius: BorderRadius.circular(8.px),
        ),
        height: mobile?2.7.h:2.7.h,
        width: mobile?6.w:5.w,
        child: widget);
  }
}
