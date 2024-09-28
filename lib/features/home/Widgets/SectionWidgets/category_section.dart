import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/category.dart';
import 'package:shuhaui/features/product_category.dart';
import '../singlewidgets/categorybuttonwidget.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.categorylist});
  final Future<List<CategoryModel>> categorylist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29.h,
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 0.74),
              itemCount: categories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (contex, index) {
                final category = categories[index];
                return CategoryWidget(
                    image: category.iconUrl,
                    text: category.name,
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => ProductCategory()));
                    });
              });
        },
      ),
    );
  }
}
