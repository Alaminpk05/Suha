// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/textwidget.dart';

class Search_Filter extends StatefulWidget {
  
  const Search_Filter({
    super.key,
   
  });

  @override
  State<Search_Filter> createState() => _Search_FilterState();
}

class _Search_FilterState extends State<Search_Filter> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Container(
            height: mobile ? 5.50.h : 5.0.h,
            width: 79.w,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(51, 40, 88, 1),
                borderRadius: BorderRadius.circular(13.sp)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/search.png',
                    height: 3.h,
                    width: 6.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                      child: TextFormField(
                    onTap: () {},
                    decoration: const InputDecoration(
                        hintText: "Search in Suha",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(153, 172, 148, 0.7)),
                        border: InputBorder.none),
                  ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: ResponsiveHelper.isTablet(context) ? 2.w : 3.w,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.sp)),
            child: PopupMenuButton(
              onSelected: (value) {
    
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.sp)),
              color: const Color.fromRGBO(51, 40, 88, 1),
              offset: mobile?const Offset(0, 49):const Offset(0, 67),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
    
                    height: 3.h,
                    value: 'voice',
                    child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: Row(
                        children: [
                          Image.asset(
                            alignment: Alignment.topLeft,
                            'assets/microphone.png',
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          textwidget(
                              text: 'Voice',
                              fontszie: 15.sp,
                              fonweight: FontWeight.normal,
                              color: const Color.fromRGBO(153, 172, 148, 0.7))
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    height: 3.h,
                    value: 'gallary',
                    child: SizedBox(
                      height: 2.2.h,
                      width: 15.w,
                      child: Row(
                        children: [
                          Image.asset(
                            alignment: Alignment.topLeft,
                            'assets/layout-collage.png',
                            height: 2.h,
                            width: 4.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          textwidget(
                              text: 'Image',
                              fontszie: 15.sp,
                              fonweight: FontWeight.normal,
                              color: const Color.fromRGBO(153, 172, 148, 0.7))
                        ],
                      ),
                    ),
                  ),
                ];
              },
              child: Container(
                width: 27.sp,
                height: 5.h,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(11, 94, 217, 1),
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/adjustments-horizontal (1).png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        )
    
      ],
    );
  }
}
