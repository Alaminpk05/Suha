import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import 'categorybuttonwidget.dart';

class ViewProductlist extends StatelessWidget {
  final String productListviewTitle;
  final void Function()? ontab;
  const ViewProductlist({
    super.key, required this.productListviewTitle,  required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
     var Mobile = ResponsiveHelper.isMobile(context);
    var Tablet = ResponsiveHelper.isTablet(context);
    return GestureDetector(
      onTap: ontab,
      child: Row(
      
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          regularfont(text:productListviewTitle, fontsize: 17.5.sp, color: Colors.white,)
          ,
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(36, 38, 68, 1),
                   minimumSize: Size(0.w,Mobile?4.1.h:3.5.h),
                  
                 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp))
              ),
      
              child: Row(
      
                children: [
                  regularfont(text: "View all", fontsize: Mobile?15.sp:13.5.sp,
                      color: Colors.white),
                  SizedBox(width: Mobile?2.w:1.w,),
                  Image.asset('assets/arrow-narrow-right.png',height: 3.h,width: Mobile?3.w:2.5.w,)
                ],
              ))
        ],
      ),
    );
  }
}