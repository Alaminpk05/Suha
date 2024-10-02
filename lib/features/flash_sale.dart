import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/cycloneofferCard.dart';
import 'package:shuhaui/features/home/data/model/cycloneoffer.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
 late Future<List<CycloneOfferModel>> datalist;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datalist=getIt<ProductService>().fetchFlashProducts();
  }

  @override
  Widget build(BuildContext context) {
    var mobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile,
          context,
          () {},
          'Flash Sale',
          filterwidget(
            mobile: mobile,
          )),
      body: FutureBuilder(
        future: datalist,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          }
          final itemlist=snapshot.data!;
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
              child: GridView.builder(
                  itemCount: itemlist.length,

                  shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1.2.w,
                      crossAxisCount: 1, childAspectRatio: 1.9),

                  itemBuilder: (context, index) {
                    final item=itemlist[index];
                    return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          var item = itemlist[index];
                          return CycloneOfferWidget(
                            value: item.soldPercentage,
                            asset: item.imageUrl,
                            title: item.title,
                          );
                        }));
                  }));
        },

      ),
    );
  }
}
