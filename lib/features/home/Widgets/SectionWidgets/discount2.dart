import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';


class DiscountSection2 extends StatelessWidget {
  const DiscountSection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      var Mobile = ResponsiveHelper.isMobile(context);

    return Container(
      height:Mobile?18.h:18.h,
      width: double.infinity,
    
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(17, 92, 211,1),
            Color.fromRGBO(40, 91, 222,1),
            Color.fromRGBO(74,90 ,238,1),
            Color.fromRGBO(97,90 ,250,1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        // Background color matching the image
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Padding(
        padding:EdgeInsets.only(right:Mobile?4.w:5,left: Mobile?0:4.w),
        child: Align(
          alignment:Alignment.center,
          child: Row(
          
            children: [
              SizedBox(
                height: Mobile?8.5.h:7.5.h,
                width: Mobile?30.w:11.8.w
                ,
                child: Image.asset(
                  'assets/discount.png', // Your image path here
                  fit: BoxFit.contain,
                
                ),
              ),
              SizedBox(width: Mobile?0.5.w:1.w,),
              Flexible(
                
                child: Padding(
                  padding:EdgeInsets.only(right: Mobile?0.w:3.w),
                  child: RichText(
                  
                    softWrap: true,
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                    children:[
                      textspan(text:"Get20% dicount!\n",
                          fontsize: Mobile?20.5.sp:18.sp,
                          color: Colors.white,
                          fontweight: FontWeight.w700),
                         
                      WidgetSpan(child: SizedBox(height: 3.h,)),
                  
                      textspan(text: Mobile?'To get discount,enter\nthe':'To get discount,enter the',
                          fontsize: Mobile?16.sp:14.5.sp, color: Colors.white,
                          fontweight: FontWeight.w400),
                      textspan(text:" GET20 ",
                          fontsize: Mobile?16.5.sp:15.sp,
                          color: Colors.white,
                          fontweight: FontWeight.w700),
                      textspan(text: 'code on the checkout page.',
                          fontsize: Mobile?16.sp:14.5.sp, color: Colors.white,
                          fontweight: FontWeight.w400),
                    ]
                  )),
                ),
              )
                
            ],
          ),
        ),
      ),
    );
  }

  TextSpan textspan({required String text,required double fontsize,required Color color,required FontWeight fontweight}) {
    return TextSpan(
      spellOut: true,
      text:text,
      style: TextStyle(overflow: TextOverflow.visible,
                      fontSize: fontsize,
                      fontWeight:fontweight,
                      color: Colors.white),
    );
  }
}