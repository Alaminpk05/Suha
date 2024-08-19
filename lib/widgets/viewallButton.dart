import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'categorybuttonwidget.dart';

class ViewProductlist extends StatelessWidget {
  final String productListviewTitle;
  final void Function()? ontab;
  const ViewProductlist({
    super.key, required this.productListviewTitle,  required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Padding(
        padding:EdgeInsets.only(top: 1.h,bottom: 1.h,right: 4.w,left: 1.w
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            regularfont(text:productListviewTitle, fontsize:  17.5.sp, color: Colors.white,)
            ,
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(36, 38, 68, 1),
                    minimumSize: Size(0.w,4.1.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp))
                ),

                child: Row(

                  children: [
                    regularfont(text: "View all", fontsize: 15.sp,
                        color: Colors.white),
                    SizedBox(width: 2.w,),
                    Image.asset('assets/arrow-narrow-right.png',height: 3.h,width: 3.w,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}