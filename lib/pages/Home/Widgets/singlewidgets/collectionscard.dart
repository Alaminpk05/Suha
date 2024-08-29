
import 'package:badges/badges.dart'as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/Home/Widgets/singlewidgets/textwidget.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key, 

    required this.assets, required this.title, required this.value
  });

  final String assets;

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 2.65.w),
      child: Stack(
        children: [
          Container(
            width: 29.w,
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
              width: 29.w,
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
              left: 2.5.w,
              child: textwidget(text: title,
                  fontszie: 16.sp,
                  fonweight: FontWeight.w400,
                  color: Colors.white)
          ),
          Positioned(
            bottom: 0.8.h,
            right: 2.5.w,
            child: SizedBox(
              height:3.h,
              width: 7.w,
              child: badges.Badge(
                stackFit: StackFit.expand,

                badgeContent: Text(
                '69',
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(),
                badgeStyle: BadgeStyle(

                  badgeColor: const Color.fromRGBO(234,76,98, 1),
                  shape: badges.BadgeShape.square,
                  borderRadius: BorderRadius.circular(11.sp),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}