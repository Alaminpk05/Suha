import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/topProductwithouttime.dart';
import '../singlewidgets/topproductswithcountdownCard.dart';
import '../singlewidgets/viewallButton.dart';



class TopProductsSection extends StatelessWidget {
  const TopProductsSection({
    super.key,
    required this.digitDays,
    required this.digitHours,
    required this.digitMinutes,
    required this.digitSeconds,
  });

  final String digitDays;
  final String digitHours;
  final String digitMinutes;
  final String digitSeconds;

  @override
  Widget build(BuildContext context) {
     var Mobile = ResponsiveHelper.isMobile(context);
    var Tablet = ResponsiveHelper.isTablet(context);
    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(
              top: widgetTopPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(
              top: widgetTopPad, left: homeTabLP, right: homeTabRP),
      child: Column(
        children: [
          ViewProductlist( productListviewTitle: 'Top Products',
            ontab: () {  },),
            SizedBox(height: Mobile?1.h:1.5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              topProductwithtime(name: "Beach Cap", image:"assets/11.png", miniButtonword:"Sale",
                  miniButtoncolor: const Color.fromRGBO(255, 175, 0,1), color: Colors.black, digitDays: digitDays, digitHours: digitHours,
                  digitMinutes: digitMinutes, digitSeconds: digitSeconds,mobile: Mobile, tablet: Tablet),
                  SizedBox(width: 1.3.w,),
              topProductwithouttime(name: 'Wooden Sofa', photo:"assets/5.png", color: const Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New', mobile: Mobile, tablet: Tablet, textcolor: Colors.white ),
              SizedBox(width: 1.3.w,),
              if(Tablet)
               topProductwithouttime(name: "Roof Lamp", photo:"assets/6.png", 
              color: const Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New',
               mobile: Mobile, tablet: Tablet, textcolor: Colors.white ),

            ],
          ),
          SizedBox(height: 1.h,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
          

             




              Mobile?topProductwithouttime(name: "Roof Lamp", photo:"assets/6.png", 
              color: const Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New',
               mobile: Mobile, tablet: Tablet, textcolor: Colors.white ):
               topProductwithtime(name:"Sneaker Shoes", image: "assets/9.png",
                miniButtonword:"-18%", miniButtoncolor: Colors.redAccent, color:Colors.white,
                  digitDays: digitDays, digitHours: digitHours, digitMinutes: digitMinutes,
                   digitSeconds: digitSeconds ,mobile: Mobile, tablet: Tablet),
                   SizedBox(width: 1.3.w,),
               SizedBox(width: 1.3.w,),
              topProductwithouttime(name: 'Wooden Sofa', photo:"assets/8.png",
                    color: Colors.redAccent, minibuttonword2: '-11%', 
                    mobile: Mobile, tablet: Tablet, textcolor: Colors.white ),
              SizedBox(width: 1.3.w,),


                   if(Tablet)
                   topProductwithouttime(name: 'Wooden Sofa', photo:"assets/4.png",
                    color: const Color.fromRGBO(255, 175, 0,1), minibuttonword2: 'Sale', 
                    mobile: Mobile, tablet: Tablet, textcolor: Colors.black ),
              SizedBox(width: 1.3.w,),

                   


            
            ],
          ),
        ],
      ),
    );
  }
}