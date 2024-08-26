import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Search_Filter extends StatelessWidget  {
  const Search_Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 2.50.h,left: 3.w
          ),
          child: Container(
            height: 5.50.h,
            width: 79.w,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(51, 40, 88, 1),
                borderRadius: BorderRadius.circular(13.sp)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/search.png',height:3.h,width: 6.w,),
                  SizedBox(width: 3.w,),
                  Expanded(child: TextFormField(
                    onTap: (){},

                    decoration: const InputDecoration(
                        hintText: "Search in Suha",
                        hintStyle: TextStyle(color: Color.fromRGBO(153,172,148,0.7)),
                        border: InputBorder.none
                    )

                    ,
                  ))


                ],
              ),
            ),

          ),
        ),
        SizedBox(width: 3.w,),
        Padding(
          padding:  EdgeInsets.only(top: 2.50.h
          ),
          child: Container(

            width: 27.sp,
            height: 5.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(11, 94, 217, 1),
                borderRadius: BorderRadius.circular(12.sp)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/adjustments-horizontal (1).png',fit: BoxFit.contain,),
            ),
          ),
        )
      ],
    );
  }
}