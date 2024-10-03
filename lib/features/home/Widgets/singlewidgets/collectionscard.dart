
import 'package:badges/badges.dart'as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key, 

    required this.assets, required this.title, required this.value
  });

  final String assets;

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    var mobile=ResponsiveHelper.isMobile(context);
    return GestureDetector(
      onTap: (){
        //  Navigator.push(context, MaterialPageRoute(builder: (c)=>PageDetails(image: assets,
        //  title: title)));
      },
      child: SizedBox(
       width: mobile?29.5.w:21.82.w,
              height:19.h,
        child: Stack(
          
          children: [
            Container(
              width: mobile?29.5.w:21.82.w,
              height:19.h,
            
              decoration: BoxDecoration(
            
                borderRadius: BorderRadius.circular(12.sp),
                image: DecorationImage(
                  image: AssetImage(assets),
                  fit: BoxFit.cover,
                ),
              ),
            ),
           
            Positioned(
              bottom: 0.h,
            
              child: Container(
                width: mobile?29.5.w:21.82.w,
                height: 18.h * (1 / 4), // 1/3 of the image height
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15.5.sp)),
                    color: Colors.transparent.withOpacity(0.7)
            
                ),
              ),
            ),
            Positioned(
                bottom: 1.h,
                left: mobile?2.5.w:2.w,
                child: textwidget(text: title,
                    fontszie: mobile?16.sp:14.sp,
                    fonweight: FontWeight.w400,
                    color: Colors.white)
            ),
            Positioned(
              bottom: 0.8.h,
              right: 2.5.w,
              child: SizedBox(
                height:mobile?2.3.h:2.h,
                width: mobile?7.w:5.w,
                child: badges.Badge(
                  stackFit: StackFit.expand,
            
                  badgeContent: Text(
                  '$value',
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  badgeAnimation: const badges.BadgeAnimation.scale(),
                  badgeStyle: BadgeStyle(
            
                    badgeColor: badgeColor,
                    shape: badges.BadgeShape.square,
                    borderRadius: BorderRadius.circular(11.sp),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}