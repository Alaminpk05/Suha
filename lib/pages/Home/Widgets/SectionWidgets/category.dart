import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../singlewidgets/categorybuttonwidget.dart';




class CategorySection2 extends StatelessWidget {
  const CategorySection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 1.w,right: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CategoryWidget(image: 'assets/tv-table.png', text: 'Home\n Application', ontap: () {  },),

          CategoryWidget(image: 'assets/beach.png', text: 'Tour & \n Travels', ontap: () {  },),
          CategoryWidget(image: 'assets/baby-products.png', text: 'Mother & \n Baby', ontap: () {  },),
          CategoryWidget(image: 'assets/price-tag.png', text: 'Clearance\n Sale', ontap: () {  },),


        ],
      ),
    );
  }
}

class CategorySection1 extends StatelessWidget {
  const CategorySection1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 1.2.w,right:1.2.w,top: 0.5.h,bottom: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CategoryWidget(image: 'assets/woman-clothes.png', text: 'Womens \n Fashion', ontap: () {  },),
          CategoryWidget(image: 'assets/grocery.png', text: 'Groceries &\n Pets', ontap: () {  },),
          CategoryWidget(image: 'assets/shampoo.png', text: 'Health &\n Beauty', ontap: () {  },),
          CategoryWidget(image: 'assets/rowboat.png', text: 'Sports &\n Outdoors', ontap: () {  },),




        ],
      ),
    );
  }
}