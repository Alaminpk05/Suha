// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/pages/pages.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/global_widgets/custom_simple_appbar.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Container(
        padding: EdgeInsets.only(left: mobile ? 1.w : 1.w),
        height: mobile ? 4.h : 4.h,
        width: mobile ? 7.5.w : 5.w,
        child: Image.asset('assets/icons/menu-2.png'));
  }
}

Widget _buildLine(double isWidth, double height) {
  return Container(
    width: isWidth, // Adjust width of the lines
    height: height, // Thickness of the lines
    color: appbariconColor, // Line color
  );
}

PreferredSize PreCustomAppBar(bool mobile, BuildContext context,
    void Function()? navigator, final String title, Widget widget) {
  return PreferredSize(
      preferredSize: Size.fromHeight(mobile ? kToolbarHeight : 5.5.h),
      child: CustomSimpleAppBar(
        title: title,
        navigation: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const Pages()));
        },
        widget: widget,
      ));
}

class filterwidget extends StatelessWidget {
  const filterwidget({
    super.key,
    required this.mobile,
  });

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return  Icon(
      CupertinoIcons.slider_horizontal_3,
      color: productColor,size: mobile?20.px:28.px,
    );
  }
}

class FiveStar extends StatelessWidget {
  const FiveStar({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Image.asset('assets/star.png', height: height, width: width);
      }),
    );
  }
}
