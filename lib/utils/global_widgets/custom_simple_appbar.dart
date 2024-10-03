import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CustomSimpleAppBar extends StatelessWidget {
  const CustomSimpleAppBar({
    super.key,
    required this.title,
    required this.navigation,
    required this.widget,
  });
  final Widget widget;

  final String title;
  final void Function()? navigation;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: mobile ? appbarMobPad : homeTabLP),
        // Add padding to the whole AppBar content
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add a back button or leading widget if needed
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: mobile ? 3.h : 4.h,
                  width: mobile ? 6.w : 4.w,
                  child: Platform.isIOS?const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,): const Icon(Icons.arrow_back,color:Colors.white,)
                ),
              ),
              const SizedBox
                  .shrink(), // Empty space for leading widget (or replace it with something)

              // The title
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: textwidget(
                      text: title,
                      fontszie: mobile ? 17.sp : 16.3.sp,
                      fonweight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              widget
            ],
          ),
        ),
      ),
    );
  }
}
