import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../../../../utils/constant.dart';
import '../singlewidgets/viewallButton.dart';
import '../singlewidgets/weeklybestsellerscard.dart';



class WeeklyBestSellerSection extends StatelessWidget {
  const WeeklyBestSellerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(
              top: widgetTopPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(
              top: widgetTopPad, left: homeTabLP, right: homeTabRP),
      child: Column(
        children: [
          ViewProductlist(productListviewTitle: 'Weekly Best Sellers', ontab: () {  },),
          SizedBox(height: sectionTopPad-.5.w,),
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
      
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context,index){
              return  Column(
                children: [
      
                  WeeklyProductsCard(image: images[index], title:tilteList[index] ,),
      
      
                ],
              );},
          )
        ],
      ),
    );
  }
}