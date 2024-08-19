import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/constant.dart';
import '../singlewidgets/viewallButton.dart';
import '../singlewidgets/weeklybestsellerscard.dart';



class WeeklyBestSellerSection extends StatelessWidget {
  const WeeklyBestSellerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.w),
          child:  ViewProductlist(productListviewTitle: 'Weekly Best Sellers', ontab: () {  },),
        ),
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
    );
  }
}