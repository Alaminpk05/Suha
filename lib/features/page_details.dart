// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/topProductwithouttime.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/viewallButton.dart';
import 'package:shuhaui/features/home/data/model/top_product.dart';
import 'package:shuhaui/features/home/data/repository/load_product_data.dart';
import 'package:shuhaui/utils/constant.dart';
import 'package:shuhaui/utils/constant/colors.dart';
import 'package:shuhaui/utils/dependency_injection/dependency_setup.dart';
import 'package:shuhaui/utils/global_widgets/circuler_menu.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';

import 'home/data/model/productdetails.dart';

class PageDetails extends StatefulWidget {
  const PageDetails({super.key});

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  late PageController pageController = PageController();
  int currentpage = 0;
  double value = 0.82;
  late Timer timer;
  int selectedStar = 0;
  late AnimationController animationController;
  late Animation<double> animation;
  double textFieldHeight = 10.h;
  bool ResizingVertically = false;




  static Color detailsPageTextColor = const Color.fromRGBO(116, 119, 148, 1);
  static Color detailPageContColor = const Color.fromRGBO(51, 40, 88, 1);

  @override
  void initState() {



    pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      currentpage++;
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });

    super.initState();
    itemlist=getIt<ProductService>().fetchRelatedProducts();
    productImage=getIt<ProductService>().fetchdetailslidableimage();
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    focusNode.dispose();
    super.dispose();
  }
late Future<List<TopProductModel>>itemlist;
  late Future<List<ProductDetailsModel>> productImage;


  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var mobile = ResponsiveHelper.isMobile(context);
    var tablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
      appBar: PreCustomAppBar(
          mobile, context, () {}, 'Product Details', const CircleMenu()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstSection(mobile,productImage),

            /// START THE SECOND HEADER
            SecondSection(
                width: width,
                detailsPageTextColor: textColor,
                value: value,
                mobile: mobile),
            SizedBox(
              height: 1.5.h,
            ),

            /// ADD TO CART COMPONENT
            ThirdSection(width: width),
            SizedBox(
              height: 1.5.h,
            ),
            SpecificationSection(detailPageContColor: productColor),

            VideoSection(width: width),
            RelatedProductsSection(
                width: width,
                detailPageContColor: detailPageContColor,
                mobile: mobile,
                tablet: tablet, datalist: itemlist,),
            SizedBox(
              height: 1.5.h,
            ),

            RatingsReviewsSection(
                detailPageContColor: detailPageContColor,
                detailsPageTextColor: detailsPageTextColor,
                widget: Column(
                  children: List.generate(3, (index) {
                    return RatingsReviews(
                      detailsPageTextColor: detailsPageTextColor,
                      detailPageContColor: detailPageContColor,
                      image: rImages[index]['image'],
                      reviews: rText[index]['title'],
                      datetime: rText[index]['subtitle'],
                      index: index,
                    );
                  }),
                )),
            SizedBox(
              height: 1.5.h,
            ),
            SubmitSection(width: width, textFieldHeight: textFieldHeight, focusNode: focusNode)
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ProductDetailsModel>> FirstSection(bool mobile,Future<List<ProductDetailsModel>> slidableimage) {
    return FutureBuilder(
      future: slidableimage,
      builder: (context,snapshot){

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found'));
        }

        final itemlist=snapshot.data!;
        return SizedBox(
          height: 25.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (int page) {
                      currentpage = page;
                    },
                    itemBuilder: (context, index) {
                      final int imageindex = index % itemlist.length;
                      final item=itemlist[imageindex];


                      return SizedBox(

                        height: 10.h,
                        width: double.infinity,
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
              Positioned(
                  bottom: 2.5.h,
                  right: 0,
                  child: Image.asset(
                    'assets/curve.png',
                    color:productColor,
                    scale: 1,
                  )),
              Positioned(bottom: -10.5.h, child: ProductHeader(mobile: mobile)),
            ],
          ),
        );
      },

    );
  }
}

class SubmitSection extends StatelessWidget {
  const SubmitSection({
    super.key,
    required this.width,
    required this.textFieldHeight,
    required this.focusNode,
  });

  final double width;
  final double textFieldHeight;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      height: 25.5.h,
      width: width,
      color: productColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textwidget(
              text: 'Submit A Review',
              fontszie: 16.px,
              fonweight: FontWeight.w600,
              color: textColor),
          SizedBox(
            height: 1.h,
          ),
          Row(
              children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: Colors.grey.shade400,
            );
          })),
          SizedBox(
            height: 1.h,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color:null,
                border: Border.all(
                    color: const Color.fromRGBO(54, 49, 86, 1))),
            width: 70.w,
            height: textFieldHeight,
            child: Stack(
              children: [
                TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  focusNode: focusNode,
                  maxLines: null,
                  cursorHeight: 1.5.h,
                  cursorColor: textColor,
                  cursorWidth: 0.15.w,
                  style: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 1.h),
                      hintText: 'Write your review...',
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(112, 114, 133, 1),
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none),
                ),


              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          DetailPageTextButton(
              ontab: () {},
              buttonWidth: 25.w,
              height: 3.h,
              text: 'Save Review')
        ],
      ),
    );
  }
}

class RelatedProductsSection extends StatelessWidget {
   RelatedProductsSection({
    super.key,
    required this.width,
    required this.detailPageContColor,
    required this.mobile,
    required this.tablet, required this.datalist,
  });

  final double width;
  final Color detailPageContColor;
  final bool mobile;
  final bool tablet;
  final Future<List<TopProductModel>>datalist;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.9.h,
      width: width.w,
      color: null,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ViewProductlist(
              productListviewTitle: 'Related Products', ontab: () {}),
          SizedBox(
            height: 1.h,
          ),
          FutureBuilder(
            future: datalist,
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found'));
              }
              final itemlist=snapshot.data;
              print('REALATED PRODUCTS LIST PRINT ');
              print(itemlist?.first.title);
              return Expanded(
                child: ListView.builder(

                    itemCount: itemlist!.length,
                    shrinkWrap: true,
                    scrollDirection:Axis.horizontal,
                    itemBuilder: (context,index){
                      final item=itemlist[index];
                      print(item.title);
                      return Padding(
                        padding:  EdgeInsets.only(right: 2.w),
                        child: topProductwithouttime(
                            name: item.title,
                            photo: item.imageUrl,
                            minibuttoncolor: const Color.fromRGBO(0, 184, 148, 1),
                            minibuttonword2: item.minibuttonword,
                            mobile: mobile,
                            textcolor: textColor,
                            tablet: tablet,
                            width: 43.5.w),
                      );
                    }),
              );
            },

          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     topProductwithouttime(
          //         name: 'Wooden Chair',
          //         photo: 'assets/8.png',
          //         minibuttoncolor: const Color.fromRGBO(0, 184, 148, 1),
          //         minibuttonword2: 'New',
          //         mobile: mobile,
          //         textcolor: textColor,
          //         tablet: tablet,
          //         width: 43.5.w),
          //     topProductwithouttime(
          //         name: 'Polo Shirt',
          //         photo: 'assets/4.png',
          //         minibuttoncolor: const Color.fromRGBO(0, 184, 148, 1),
          //         minibuttonword2: 'New',
          //         mobile: mobile,
          //         textcolor: Colors.white,
          //         tablet: tablet,
          //         width: 43.5.w)
            ],
          ),


    );
  }
}

class RatingsReviewsSection extends StatelessWidget {
  const RatingsReviewsSection({
    super.key,
    required this.detailPageContColor,
    required this.detailsPageTextColor,
    required this.widget,
  });

  final Color detailPageContColor;
  final Color detailsPageTextColor;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(
        top: 2.h,
        left: 5.w,
        right: 5.w,
      ),
      color: productColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textwidget(
              text: 'Ratings & Reviews',
              fontszie: 16.px,
              fonweight: FontWeight.w700,
              color: textColor),
          SizedBox(
            height: 1.3.h,
          ),
          widget,
        ],
      ),
    );
  }
}

class RatingsReviews extends StatelessWidget {
  const RatingsReviews(
      {super.key,
      required this.detailsPageTextColor,
      required this.detailPageContColor,
      required this.image,
      required this.reviews,
      required this.datetime,
      required this.index});
  final int index;

  final Color detailsPageTextColor;
  final Color detailPageContColor;
  final String image;
  final String reviews;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
            SizedBox(
              width: 2.5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FiveStar(height: 1.5.h, width: 3.w),
                SizedBox(
                  height: 0.5.h,
                ),
                textwidget(
                    text: reviews,
                    fontszie: 14.px,
                    fonweight: FontWeight.w400,
                    color: textColor),
                SizedBox(height: 0.3.h),
                textwidget(
                    text: datetime,
                    fontszie: 12.px,
                    fonweight: FontWeight.w400,
                    color: textColor),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  children: [
                    index == 2
                        ? const SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : DetailPageIconButton(
                            width: 12.w,
                            height: 6.h,
                            widget: Image.asset(
                                index == 0 ? 'assets/3.png' : 'assets/4.png'),
                            ontab: () {},
                            color: productColor,
                          ),
                    if (index == 1)
                      SizedBox(
                        width: 2.w,
                      ),
                    if (index == 1)
                      DetailPageIconButton(
                        width: 12.w,
                        height: 6.h,
                        widget: Image.asset('assets/6.png'),
                        ontab: () {},
                        color: productColor,
                      ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 1.3.h,
        ),
        index == 2
            ? const SizedBox(
                height: 0,
                width: 0,
              )
            : Row(
                children: List.generate(45, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                  height: 0.2.h,
                  width: 1.w,
                  color: textColor,
                );
              })),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }
}

class VideoSection extends StatelessWidget {
  const VideoSection({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      height: 18.h,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/18.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: textwidget(
                    text: "Summer Clothing",
                    fontszie: 20.px,
                    fonweight: FontWeight.w700,
                    color: Colors.white),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 2.h),
                  height: 4.5.h,
                  width: 9.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(24,179,210,1),
                  ),
                  child: Image.asset(
                    'assets/player-play (1).png',
                    scale: 15,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
    required this.width,
    required this.detailsPageTextColor,
    required this.value,
    required this.mobile,
  });

  final double width;
  final Color detailsPageTextColor;
  final double value;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
      color: productColor,
      height: 8.h,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textwidget(
                  text: 'Flash sale end in',
                  fontszie: 15.sp,
                  fonweight: FontWeight.w400,
                  color: textColor),
              SizedBox(
                height: 0.3.h,
              ),
              textwidget(
                  text: '150d 24h 60m 60s',
                  fontszie: 15.sp,
                  fonweight: FontWeight.w700,
                  color: textColor),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${(value * 100).toStringAsFixed(0)}% Sold Out",
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.3.h,
              ),
              SizedBox(
                width: width * 0.3,
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(25.sp),
                  padding: EdgeInsets.symmetric(horizontal: mobile ? 0.6.w : 0),
                  lineHeight: 0.7.h,
                  percent: value,
                  progressColor: const Color.fromRGBO(255, 176, 0, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SpecificationSection extends StatelessWidget {
  const SpecificationSection({
    super.key,
    required this.detailPageContColor,
  });

  final Color detailPageContColor;

  @override
  Widget build(BuildContext context) {
    return SpecificationsWidget(
      title: 'Specifications',
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. '
          'Quasi, eum? Id, culpa? At officia quisquam laudantium nisi '
          'molitia nesciunt, qui porro asperiores cum voluptates placeat '
          'similique recusandae in facere quos vitae?',
      specifications: const [
        '100% Good Reviews',
        '7 Days Returns',
        'Warranty not Applicable',
        '100% Brand New Product',
      ],
      contentColor: detailPageContColor,
    );
  }
}

class ThirdSection extends StatelessWidget {
  const ThirdSection({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: width,
      color: productColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Row(
          children: [
            DetailPageIconButton(
              width: 8.w,
              widget: Icon(
                CupertinoIcons.minus,
                color: Colors.white,
                size: 16.sp,
              ),
              height: 3.5.h,
              ontab: () {},
              color: const Color.fromRGBO(36, 38, 68, 1),
            ),
            SizedBox(
              width: 3.w,
            ),
            DetailPageIconButton(
              width: 11.w,
              widget: Align(
                alignment: Alignment.center,
                child: textwidget(
                    text: '0',
                    fontszie: 16.sp,
                    fonweight: FontWeight.w400,
                    color: Colors.white),
              ),
              height: 3.5.h,
              ontab: () {},
              color: const Color.fromRGBO(36, 38, 68, 1),
            ),
            SizedBox(
              width: 3.w,
            ),
            DetailPageIconButton(
              width: 8.w,
              widget: Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 16.sp,
              ),
              height: 3.5.h,
              ontab: () {},
              color: const Color.fromRGBO(36, 38, 68, 1),
            ),
            SizedBox(
              width: 4.w,
            ),
            DetailPageTextButton(
              ontab: () {},
              buttonWidth: 22.w,
              height: 3.5.h,
              text: 'Add To Cart',
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPageTextButton extends StatelessWidget {
  const DetailPageTextButton({
    super.key,
    required this.ontab,
    required this.buttonWidth,
    required this.height,
    required this.text,
  });
  final void Function()? ontab;
  final double buttonWidth;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(24,179,210,1),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: textwidget(
            text: text,
            fontszie: 14.px,
            fonweight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}

/// SART COMPONENT FROM HERE

/// SPECIFICATION COMPONENT

class SpecificationsWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> specifications;
  final Color contentColor;

  const SpecificationsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.specifications,
    required this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      color: contentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: textColor,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          textwidget(
              text:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi, eum? Id, culpa? At officia quisquam laudantium nisi mollitia nesciunt, qui porro asperiores cum voluptates placeat similique recusandae in facere quos vitae?',
              fontszie: 15.sp,
              fonweight: FontWeight.w400,
              color: textColor),
          SizedBox(height: 2.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: specifications
                .map((spec) => Column(
                      children: [
                        SpecificationRules(
                          title: spec,
                        ),
                        // const SpecificationRules(
                        //   title: '7 Days Returns',
                        // ),
                        // const SpecificationRules(
                        //   title:  'Warranty not Aplicable',
                        // ),
                        // const SpecificationRules(
                        //   title: '100% Brand New Product',
                        // ),
                      ],
                    ))
                .toList(),
          ),
          SizedBox(height: 1.5.h),
          textwidget(
              text:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi, eum? Id, culpa? At officia quisquam laudantium nisi mollitia nesciunt, qui porro asperiores cum voluptates placeat similique recusandae in facere quos vitae?',
              fontszie: 15.sp,
              fonweight: FontWeight.w400,
              color: textColor),
        ],
      ),
    );
  }
}

class SpecificationRules extends StatelessWidget {
  const SpecificationRules({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/check.png',
          color: textColor,
          scale: 18,
        ),
        SizedBox(
          width: 1.w,
        ),
        textwidget(
            text: title,
            fontszie: 15.sp,
            fonweight: FontWeight.w400,
            color: textColor)
      ],
    );
  }
}

/// ICON BUTTON

class DetailPageIconButton extends StatelessWidget {
  const DetailPageIconButton({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
    required this.ontab,
    required this.color,
  });
  final double width;
  final double height;
  final Widget widget;
  final void Function()? ontab;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: const Color.fromRGBO(58, 60, 88, 1),
            ),
          ),
          child: widget),
    );
  }
}

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.mobile,
  });

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.5.h),
      decoration: BoxDecoration(
          color: productColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp))),
      height: 13.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textwidget(
                  text: 'Wooden Sofa',
                  fontszie: 18.sp,
                  fonweight: FontWeight.w700,
                  color: textColor),
              SizedBox(
                  height: 3.h,
                  width: 5.w,
                  child: Image.asset(
                    'assets/heart (3).png',
                    fit: BoxFit.contain,
                  ))
            ],
          ),
          Row(
            children: [
              Text(
                "\$55",
                style: TextStyle(
                  color: const Color.fromRGBO(202, 50, 68, 1),
                  fontSize: mobile ? 17.sp : 15.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$15",
                style: TextStyle(
                  color: textColor,
                  fontSize: mobile ? 14.5.sp : 13.5.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: textColor,
                  decorationThickness: 0.3.h,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: mobile ? 0.1.w : 0.3.w),
                        child: Image.asset(
                          'assets/star.png',
                          height: mobile ? 2.5.h : 2.h,
                          width: mobile ? 2.8.w : 1.5.w,
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  textwidget(
                    text: '3 ratings',
                    fontszie: 14.sp,
                    fonweight: FontWeight.w400,
                    color: textColor,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 2.h,
                    width: 8.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: const Color.fromRGBO(234, 76, 98, 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: textwidget(
                          text: '5.0',
                          fontszie: 14.sp,
                          fonweight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  textwidget(
                      text: 'Very Good',
                      fontszie: 14.sp,
                      fonweight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 184, 148, 1))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
