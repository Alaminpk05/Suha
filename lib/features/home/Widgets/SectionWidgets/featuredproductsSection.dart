import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/viewallButton.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/featuredproducts.dart';

class Featuredproductssection extends StatefulWidget {
  const Featuredproductssection({super.key});

  @override
  State<Featuredproductssection> createState() =>
      _FeaturedproductssectionState();
}

class _FeaturedproductssectionState extends State<Featuredproductssection> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
   
    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(
              top: widgetTopPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(
              top: widgetTopPad, left: homeTabLP, right: homeTabRP),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ViewProductlist(
              productListviewTitle: "Featured Products", ontab: () {}),
          SizedBox(
            height: mobile?1.h:1.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeaturedProducts(
                image: 'assets/14.png',
                title: 'Blue Skateboard',
                newprice: '39',
                oldprice: '89',
                ontap: () {},
              ),
              SizedBox(
                width: 1.w,
              ),
              FeaturedProducts(
                image: 'assets/15.png',
                title: 'Travel Bag',
                newprice: '14.7',
                oldprice: '21',
                ontap: () {},
              ),
              SizedBox(
                width: 1.w,
              ),
              FeaturedProducts(
                image: 'assets/16.png',
                title: 'Cotton T- Shirt',
                newprice: '3.69',
                oldprice: '5',
                ontap: () {},
              ),
            ],
          ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeaturedProducts(
                image: 'assets/21.png',
                title: 'ECG Rice Maker',
                newprice: '9.99',
                oldprice: '13',
                ontap: () {},
              ),
              SizedBox(
                width: 1.5.w,
              ),
              FeaturedProducts(
                image: 'assets/20.png',
                title: 'Beauty Cent',
                newprice: '5.99',
                oldprice: '8',
                ontap: () {},
              ),
              SizedBox(
                width: 1.w,
              ),
              FeaturedProducts(
                image: 'assets/19.png',
                title: 'Basketball',
                newprice: '16',
                oldprice: '19',
                ontap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
