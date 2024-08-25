import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/categoryView.dart';
import 'package:shuhaui/utils/constant.dart';
import '../singlewidgets/categorybuttonwidget.dart';




class CategorySection1 extends StatelessWidget {
  CategorySection1({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.2.w, right: 1.2.w, top: 0.5.h, bottom: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categoryDataList1.length, (index) {
          final item = categoryDataList1[index];
          return CategoryWidget(
            image: item['image'],
            text: item['text'],
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  Categoryview(title: item['title'])));
            },
          );
        }),
      ),
    );
  }
}




class CategorySection2 extends StatelessWidget {
   CategorySection2({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 1.w,right: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: List.generate(categoryDataList2.length, (index){
          final item = categoryDataList2[index];
          return CategoryWidget(image: item['image'], text: item['text'], ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                Categoryview(title: item['title'])));
          });
        })
      ),
    );
  }
}

