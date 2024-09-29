// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/feature_products.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/viewallButton.dart';
import 'package:shuhaui/features/home/data/model/fetured_product.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/featuredproducts.dart';

class Featuredproductssection extends StatefulWidget {
  const Featuredproductssection({
    super.key,
    required this.featuredProductList,
  });
  final Future<List<FeaturedProductModel>> featuredProductList;

  @override
  State<Featuredproductssection> createState() =>
      _FeaturedproductssectionState();
}

class _FeaturedproductssectionState extends State<Featuredproductssection> {
  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewProductlist(
            productListviewTitle: "Featured Products",
            ontab: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const FeaturedProductPage()));
            }),
        SizedBox(
          height: mobile ? 0.8.h : 1.5.h,
        ),
        SizedBox(
          height: 41.h,
          width: double.infinity,
          child: FutureBuilder(
            future: widget.featuredProductList,
            builder: (contex, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found'));
              }
              final featuredProductList = snapshot.data!;
              return GridView.builder(
                  itemCount: featuredProductList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.72,
                   crossAxisSpacing: 1.2.w
                  ),
                  itemBuilder: (context, index) {
                    final item = featuredProductList[index];
                    return FeaturedProducts(
                        image: item.image,
                        title: item.name,
                        newprice: item.price,
                        oldprice: item.originalPrice);
                  });
            },
          ),
        ),
      ],
    );
  }
}
