import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../singlewidgets/collectionscard.dart';
import '../singlewidgets/viewallButton.dart';

class CollectionsSection extends StatelessWidget {


  List<Map<String, dynamic>> CollectionDataList = [
    {'value': '9', 'asset': 'assets/17.jpg', 'title': 'Women'},
    {'value': '29', 'asset': 'assets/19.jpg', 'title': 'Men'},
    {'value': '4', 'asset': 'assets/21.jpg', 'title': 'Kids'},

  ];

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left:3.w),
            child: ViewProductlist(productListviewTitle: 'Collections',
                ontab: (){}),
          ),
          SizedBox(
            height: 16.h,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(left: 3.5.w),
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
    );
  }
}
