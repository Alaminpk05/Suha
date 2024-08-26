import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
    required this.switchValue,
  });

  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.5) , BlendMode.dstATop),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.5.w),

        height: 21.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage('assets/dark.jpg'),
              filterQuality: FilterQuality.high,fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 7.w,bottom: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              Text("You can change your display to a dark "
                  "\n background using a dark mode.",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily:"PlusJakartaSans-Regular.ttf",

                    fontSize: 16.sp ),textAlign: TextAlign.start,),
              Switch(
                  activeColor: Colors.purple,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color.fromRGBO(12, 21, 59, 1),

                  value: switchValue,

                  onChanged:(value){

                  })
            ],
          ),
        ),
      ),
    );
  }
}