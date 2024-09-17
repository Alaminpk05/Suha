import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;

  const HomeAppBar({super.key, this.appBarHeight = kToolbarHeight});
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return AppBar(
      automaticallyImplyLeading: false,
    leading: mobile?Padding(
        padding: EdgeInsets.only(left:4.w, bottom: 0.5.h),
        child: Image.asset(
          "assets/logo-small.png",

          fit: BoxFit.contain,
        ),
      ):null,
      title: tablet? Padding(
        padding: EdgeInsets.only(left: 11.w),
        child: Image.asset('assets/logo-small.png',height: 3.5.h,
        alignment: Alignment.center
        ,width: 5.5.w,
        fit: BoxFit.contain,),
      ):null,
      
      
      actions: [
        Padding(
          padding: mobile?EdgeInsets.symmetric(vertical:0.sp):EdgeInsets.only(right:11.2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children:[

                  Container(
                    padding: EdgeInsets.only(right:1.w),
                  height: mobile?4.h:4.h,
                  width: mobile?8.w:6.2.w,
                  child: Image.asset(
                    // height: mobile?4.20.h:0.h,
                    "assets/basket (1).png",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 1.75.h,
                  left: mobile?3.8.w:2.w,
                    child:Container(
                      constraints: BoxConstraints(maxHeight:1.6.h,
                      minWidth: 5.w),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(98, 90, 250, 1),
                        shape: BoxShape.circle

                      ),
                      child:Align(
                        alignment: Alignment.center,
                        child: textwidget(text: '13',
                            fontszie: 11.5.sp,
                            fonweight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                ),


                ],
              ),
               SizedBox(
          width: 2.5.w,
        ),
        Container(
          height: mobile?4.h:4.h,
          width: mobile?6.w:4.4.w,
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
          child: CircleMenu(),),
        SizedBox(
          width: 4.w,
        )
            ],
          ),
        ),
       
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
