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
     var mobile = ResponsiveHelper.isMobile(context);
    
    return GestureDetector(
      onTap: ontab,
      child: Row(
      
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          regularfont(text:productListviewTitle,
           fontsize: 17.5.sp, color: Colors.white,)
          ,
          ElevatedButton(onPressed: ontab,
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromRGBO(226, 248, 251, 1),
                  //  const Color.fromRGBO(36, 38, 68, 1),
                   minimumSize: Size(0.w,mobile?4.1.h:3.5.h),
                  
                 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp))
              ),
      
              child: Row(
      
                children: [
                  regularfont(text: "View all", 
                  fontsize: mobile?15.sp:13.5.sp,
                      color: Colors.black),
                  SizedBox(width: mobile?2.w:1.w,),
                  Image.asset('assets/arrow-narrow-right.png', 
                  color: Colors.black, 
                  height: 3.h,width: mobile?3.w:2.5.w,)
                ],
              ))
        ],
      ),
    );
  }
}