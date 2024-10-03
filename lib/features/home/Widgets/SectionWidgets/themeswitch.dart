import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
    required this.switchValue,
  });

  final bool switchValue;

  @override
  Widget build(BuildContext context) {
      var Mobile=ResponsiveHelper.isMobile(context);
    var Tablet=ResponsiveHelper.isTablet(context);
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
         scaffoldColor.withOpacity(0.5) , BlendMode.dstATop),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.sp),
        clipBehavior:Clip.hardEdge ,
        child: Container(
         
            
          height: Mobile?18.h:18.h,
          width: double.infinity,
          decoration: BoxDecoration(
            
            image:  DecorationImage(
            
              image: 
            AssetImage('assets/images/night.jpg'),
                filterQuality: FilterQuality.high,fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
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
                    activeColor: Color.fromRGBO(24,179,210,1),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color.fromRGBO(12, 21, 59, 1),
            
                    value: switchValue,
            
                    onChanged:(value){
            
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}