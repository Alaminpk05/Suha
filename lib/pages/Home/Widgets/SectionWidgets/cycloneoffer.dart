import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constant.dart';
import '../singlewidgets/cycloneofferCard.dart';


class CycloneOfferSection extends StatelessWidget {
  const CycloneOfferSection({
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
    return Container(
      padding: EdgeInsets.only(top: 1.5.h,left: 2.8.w,right: 1.w,bottom: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [
          Padding(
            padding:  EdgeInsets.only(left: .6.w
                ,right:3.2.w ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cyclone Offer",style: TextStyle(color: Colors.white,
                    fontSize: 17.sp,fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,),
                Text("${digitDays}d ${digitHours}h ${digitMinutes}m ${digitSeconds}s",style: TextStyle(color: Colors.white,
                    fontSize: 17.sp,fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,),

              ],
            ),
          ),


          Container(
              height: 46.5.w,width:100.w,
              child: ListView.builder(
                  itemCount: null,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,

                  itemBuilder: (context,index){
                    final realIndex = index % cycloneOfferItems.length;
                    print(realIndex);
                    final item = cycloneOfferItems[realIndex];

                    return CycloneOfferWidget(
                      value: item['value'],
                      asset: item['asset'],
                      title: item['title'],
                    );})
          )


        ],
      ),
    );
  }
}