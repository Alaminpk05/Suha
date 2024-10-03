import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/category.dart';
import 'package:shuhaui/features/product_category.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';
import '../singlewidgets/categorybuttonwidget.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.categorylist});
  final Future<List<CategoryModel>> categorylist;

  @override
  Widget build(BuildContext context) {
    var mobile=ResponsiveHelper.isMobile(context);
    return SizedBox(
      height: mobile?29.h:29.h,
      width: double.infinity,
      child: FutureBuilder<List<CategoryModel>>(
        future: categorylist,
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          }

          final categories = snapshot.data!;
          return GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: mobile?0:0.35.w,
                mainAxisSpacing: 1.2.w,
                  crossAxisCount: 4, childAspectRatio: mobile?0.74:0.8),
              itemCount: categories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (contex, index) {
                final category = categories[index];
                return CategoryWidget(
                    image: category.iconUrl,
                    text: category.name,
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => const ProductCategory()));
                    });
              });
        },
      ),
    );
  }
}
