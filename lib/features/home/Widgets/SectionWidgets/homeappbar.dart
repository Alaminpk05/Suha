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
                  width: mobile?8.5.w:6.2.w,
                  child: Image.asset(
                    // height: mobile?4.20.h:0.h,
                    "assets/basket (1).png",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 1.75.h,
                  left: mobile?4.4.w:2.w,
                    child:Container(
                      constraints: BoxConstraints(maxHeight:1.65.h,
                      minWidth: 4.2.w),
                      decoration: const BoxDecoration(
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
          width: mobile?7.5.w:5.w,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromRGBO(
                  92, 83, 121, 1),
              width: mobile?0.38.w:0.3.w,
            ),
           
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: mobile?3.h:3.h,
              width: mobile?6.5.w:4.25.w,
                padding: EdgeInsets.all(5.sp),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/9.jpg'),
              ),

            ),
          )
        ),
        SizedBox(
          width: 2.5.w,
        ),
        GestureDetector(
          onTap: () {},
          child: const CircleMenu(),),
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
