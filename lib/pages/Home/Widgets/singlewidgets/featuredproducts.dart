import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class FeaturedProducts extends StatelessWidget {
  final String image;
  final String title;
  final String newprice;
  final String oldprice;
  final void Function()? ontap;
  const FeaturedProducts({
    super.key, required this.image, required this.title, required this.newprice, required this.oldprice, this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
            height: 20.h,
            width: 30.w,
            margin: EdgeInsets.only(
                top: .5.h, left: 0.5.w, right: 0.5.h, bottom: 0.5.h),
            padding: EdgeInsets.only(right: 0.5.w),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(36, 38, 68, 1),
                borderRadius: BorderRadius.circular(10)),
      
            child: Stack(
              children:[
                Padding(
                  padding:  EdgeInsets.only(top: 2.5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
      
                      Center(
      
                          child: SizedBox(
                            height: 9.h,
                            width: 30.w
                            ,
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                            ),
                          )),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w,right:3.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.5.sp,
                                  fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(children: [
                              Text(
                                "\$$newprice",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 1.w),
                              Center(
                                child: Text(
                                  "\$$oldprice",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(116, 119, 148, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor:
                                    const Color.fromRGBO(116, 119, 148, 1),
                                    decorationThickness: 0.3.h,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
      
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 2.3.w,
                  top: 1.5.h,
                  child: Container(
                    height:3.h,
                    width: 6.5.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/circle.png',),fit: BoxFit.contain),
                    ),
      
                  ),
                ),
                Positioned(
                  left: 4.w,
                  top:2.3.h,
      
                  child:Container(
                    height:1.4.h,
                    width: 3.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/star (1).png',),fit: BoxFit.contain),
                    ),
                  ), ),
      
              ],
            )),
      ),
    );
  }
}