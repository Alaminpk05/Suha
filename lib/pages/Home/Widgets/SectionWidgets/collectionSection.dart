import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/collectionscard.dart';
import '../singlewidgets/viewallButton.dart';

class CollectionsSection extends StatelessWidget {


  List<Map<String, dynamic>> CollectionDataList = [
    {'value': '9', 'asset': 'assets/17.jpg', 'title': 'Women'},
    {'value': '29', 'asset': 'assets/19.jpg', 'title': 'Men'},
    {'value': '4', 'asset': 'assets/21.jpg', 'title': 'Kids'},

  ];

  CollectionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(
              top: widgetTopPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(
              top: widgetTopPad, left: homeTabLP, right: homeTabRP),
      child: Container(
      
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewProductlist(productListviewTitle: 'Collections',
                ontab: (){}),
            SizedBox(
              height: 19.h,
              width: double.infinity,
              child: Container(
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
      
      
                  itemBuilder:(context,index){
                    final realIndex = index % CollectionDataList.length;
                    final item = CollectionDataList[realIndex];
                    return CollectionCard(assets: item['asset'],
                      title:item['title'], value: item['value'],
                     );},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
