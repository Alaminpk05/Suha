import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/authentication/login/forgot.dart';
import 'package:shuhaui/features/home/data/model/category.dart';
import '../singlewidgets/categorybuttonwidget.dart';

class CategorySection1 extends StatelessWidget {
  const CategorySection1({super.key, required this.categorylist});
  final List<CategoryModel> categorylist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:29.h,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            
              crossAxisCount: 4, childAspectRatio: 0.74),
              
          itemCount: categorylist.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (contex, index) {
            final category = categorylist[index];
            return CategoryWidget(
                image: category.iconUrl, text: category.name, ontap: () {});
          }),
    );

    
  }
}

