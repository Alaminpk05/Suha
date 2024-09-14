import 'package:flutter/material.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/weeklybestsellerscard.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class Categoryview extends StatelessWidget {
  final String title;
  final String image;
  const Categoryview({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
       padding: ResponsiveHelper.isMobile(context)
          ? EdgeInsets.only(
              top: widgetTopPad, left: homeMobLP, right: homeMobRP)
          : EdgeInsets.only(
              top: widgetTopPad, left: homeTabLP, right: homeTabRP),
        child: Container(
          child:ListView.builder(
              itemCount:20,itemBuilder: (context,index){
            return WeeklyProductsCard(image: image, title: title);
          }
          ),
        ),
      ),

    );
  }
}
