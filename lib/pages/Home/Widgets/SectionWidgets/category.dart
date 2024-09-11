import 'package:flutter/material.dart';
import 'package:shuhaui/pages/categoryView.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';
import '../singlewidgets/categorybuttonwidget.dart';

class CategorySection1 extends StatelessWidget {
  const CategorySection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(
              top: widgetTopPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(
              top: widgetTopPad, left: homeTabLP, right: homeTabRP),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categoryDataList1.length, (index) {
          final item = categoryDataList1[index];
          return CategoryWidget(
            image: item['image'],
            text: item['text'],
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Categoryview(
                            title: item['title'],
                            image: item['image'],
                          )));
            },
          );
        }),
      ),
    );
  }
}

class CategorySection2 extends StatelessWidget {
  const CategorySection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(top: oneHeightPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(top: oneHeightPad, left: homeTabLP, right: homeTabRP),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(categoryDataList2.length, (index) {
            final item = categoryDataList2[index];
            return CategoryWidget(
                image: item['image'],
                text: item['text'],
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Categoryview(
                                title: item['title'],
                                image: item['image'],
                              )));
                });
          })),
    );
  }
}
