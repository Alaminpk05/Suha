import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/featuredproducts.dart';
import 'package:shuhaui/features/home/data/model/fetured_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class FeaturedProductPage extends StatefulWidget {
  const FeaturedProductPage({
    super.key,
  });

  @override
  State<FeaturedProductPage> createState() => _FeaturedProductPageState();
}

class _FeaturedProductPageState extends State<FeaturedProductPage> {
  late Future<List<FeaturedProductModel>> featuredProductList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featuredProductList = getIt<ProductService>().fetchFeaturedProductList();
  }

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile,
          context,
          () {},
          'Featured Products',
          filterwidget(
            mobile: mobile,
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: mobile?1.5.h:homeTopPad,
           horizontal: mobile?3.w:homeTabLP),
          child: FutureBuilder(
            future: featuredProductList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found'));
              }
              final featuredproductList = snapshot.data!;
              return GridView.builder(
                  itemCount: featuredproductList.length,
                  shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.2.w,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final item = featuredproductList[index];
                    return FeaturedProduct(
                      image: item.image,
                      title: item.name,
                      newprice: item.price,
                      oldprice: item.originalPrice,
                      ontap: () {},
                    );
                  });
            },
          )),
    );
  }
}
