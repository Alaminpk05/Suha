

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeeklyProductsCard extends StatelessWidget {
  final String image;
  final String title;
  const WeeklyProductsCard({
    super.key, required this.image, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.5.w,vertical: 0.5.h),
      height: 12.h,

      decoration: BoxDecoration(
        color: const Color.fromRGBO(36, 38, 68,1), // Use the passed container color
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 1.h,bottom: 1.h
            ),
            height: double.infinity,
            width: 25.w,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: const Color.fromRGBO(51,40,88, 1)

            ),
            child: Stack(
                children:[
                  Positioned(




                    child: SizedBox(
                      height: 22.h,
                      width: 19.w,
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,



                      ),
                    ),
                  ),

                  Positioned(
                    left: 1.w,
                    bottom: 6.1.h,


                    child: Container(
                      height: 5.h,
                      width: 5.w,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(36, 38, 68,1),
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.5.sp),
                        child: Image.asset(
                          'assets/heart (3).png',
                          height: 3.h,
                          width: 3.w,


                        ),
                      ),
                    ),
                  ),
                ]
            ),

          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 1.8.h,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      const Text(
                        '\$54',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '\$64',
                        style: TextStyle(
                          color: Color(0xFFDC3545),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "4.88",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),Text(
                        " (125 Reviews",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}