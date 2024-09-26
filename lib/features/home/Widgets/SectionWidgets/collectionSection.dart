// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/collections.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/collectionscard.dart';
import '../singlewidgets/viewallButton.dart';

class CollectionsSection extends StatelessWidget {
  final List<Map<String, dynamic>> CollectionDataList = [
    {'value': '9', 'asset': 'assets/17.jpg', 'title': 'Women'},
    {'value': '29', 'asset': 'assets/19.jpg', 'title': 'Men'},
    {'value': '4', 'asset': 'assets/21.jpg', 'title': 'Kids'},
  ];

  CollectionsSection({
    super.key,
    required this.collectionProductList,
  });
  final List<Collections> collectionProductList;

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewProductlist(productListviewTitle: 'Collections', ontab: () {}),
        SizedBox(
          height: mobile ? 1.h : 1.5.h,
        ),
        SizedBox(
          height: 19.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: collectionProductList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // final realIndex = index % collectionProductList.length;
              final item = collectionProductList[index];
              return Padding(
                padding: EdgeInsets.only(right: mobile ? 2.5.w : 1.7.w),
                child: CollectionCard(
                  assets: item.image,
                  title: item.name,
                  value: item.itemCount,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
