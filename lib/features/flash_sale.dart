import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/data/model/cycloneoffer.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/features/product_details/page/page_details.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/constant/static.dart';
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
    datalist = getIt<ProductService>().fetchFlashProducts();
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
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found'));
              }
              final itemlist = snapshot.data!;
              return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: mobile ? 1.5.h : homeTopPad,
                      horizontal: mobile ? 2.w : homeTabLP),
                  child: GridView.builder(
                      itemCount: itemlist.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 1.2.w,
                          crossAxisSpacing: 1.2.w,
                          crossAxisCount: 3,
                          childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        final item = itemlist[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageDetails(
                                          image: item.imageUrl,
                                          title: item.title,
                                        )));
                          },
                          child: Container(
                              // height: mobile?23.h:12.h,
                              // width: mobile?30.w:22.w,
                              constraints: BoxConstraints(
                                  maxWidth: mobile ? 30.w : 22.w,
                                  maxHeight: mobile ? 23.h : 15.h),
                              decoration: BoxDecoration(
                                  color: productColor,
                                  //  const Color.fromRGBO(36, 38, 68, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.only(
                                  bottom: mobile ? 0.h : 0.h,
                                  top: mobile ? 0.5.h : 0.5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.5.w),
                                    child: Center(
                                        child: Image.asset(
                                      item.imageUrl,
                                      width: mobile ? 30.w : null,
                                    )),
                                  ),
                                  SizedBox(
                                    height: mobile ? 0.h : 0.5.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.5.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: mobile ? 16.sp : 15.sp,
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 0.0.h,
                                        ),
                                        Row(children: [
                                          Text(
                                            "\$7.99",
                                            style: TextStyle(
                                                color: textColor,
                                                fontSize:
                                                    mobile ? 16.sp : 14.sp,
                                                fontWeight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(width: 1.w),
                                          Center(
                                            child: Text(
                                              "\$15",
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize:
                                                    mobile ? 15.5.sp : 13.5.sp,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                // decorationColor: const Color.fromRGBO(116, 119, 148, 1),
                                                decorationThickness: 0.3.h,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 0.0.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${(item.soldPercentage * 100).toStringAsFixed(0)}% Sold",
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            LinearPercentIndicator(
                                              barRadius: Radius.circular(25.sp),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      mobile ? 0.6.w : 0),
                                              lineHeight: 0.5.h,
                                              percent: item.soldPercentage,
                                              progressColor: productSoldColor,
                                              //  const Color.fromRGBO(13, 110, 253, 1),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        );
                      }));
            }));
  }
}
