// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/viewallButton.dart';
import 'package:shuhaui/features/home/data/model/fetured_product.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import '../singlewidgets/featuredproducts.dart';

class Featuredproductssection extends StatefulWidget {
  const Featuredproductssection({
    super.key,
    required this.featuredProductList,
  });
  final List<FeaturedProduct> featuredProductList;

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
            productListviewTitle: "Featured Products", ontab: () {}),
        SizedBox(
          height: mobile ? 0.8.h : 1.5.h,
        ),
        SizedBox(
          height: 41.h,
          width: double.infinity,
          child: GridView.builder(
            
            itemCount: widget.featuredProductList.length,
            physics: const NeverScrollableScrollPhysics(),
            
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    
                    
                    
                    
                    ),
              itemBuilder: (context, index) {
                final item = widget.featuredProductList[index];
                return FeaturedProducts(
                    image: item.image,
                    title: item.name,
                    newprice: item.price,
                    oldprice: item.originalPrice);
              }),
        ),
      
      ],
    );
  }
}
