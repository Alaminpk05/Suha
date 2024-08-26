import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double appBarHeight;

  const HomeAppBar({super.key, this.appBarHeight = kToolbarHeight});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 4.w, bottom: 0.5.h),
        child: Image.asset(
          "assets/logo-small.png",
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(3.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  height: 4.20.h,
                  "assets/basket (1).png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 2.5.w,
        ),
        Container(
          height: 9.h,
          width: 7.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/9.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 2.5.w,
        ),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 3.h,
            width: 8.50.w,
            child: Image.asset(
              height: 3.h,
              "assets/menu-2.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBarHeight);



}
