import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/Home/Widgets/singlewidgets/textwidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constant.dart';


class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  PageController pageController = PageController();
  int currentindex = 0;

  final List<Map<String, String>> sliderData = [
    {
      "image": 'assets/1.jpg',
      "title": 'Amazon Echo',
      "subtitle": '3rd Generation, Charcoal',
    },
    {
      "image": 'assets/2.jpg',
      "title": 'Light Candle',
      "subtitle": 'Now only \$22',
    },
    {
      "image": 'assets/3.jpg',
      "title": 'Fancy Chair',
      "subtitle": '3 years Wrranty',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.sp),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 3.5.w, right: 3.5.w, top: 2.h, bottom: 1.h),
            child: Container(
              height: 21.h,
              width: double.infinity,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                child:PageView.builder(
                  controller: pageController,

                  itemBuilder: (context, index) {
                    final realindex=index% sliderData.length;
                    final item=sliderData[realindex];
                    return Stack(
                      children: [
                        // Image
                        Positioned.fill(
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Overlay with text and button
                        Positioned(
                          left: 7.w,
                          bottom: 4.3.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textwidget(text: "${item['title']}",
                                  fontszie: 20.5.sp, fonweight: FontWeight.w600,
                                  color: Color.fromRGBO(255, 255,
                                      255, 0.95)),
                              SizedBox(height: 0.3.h),
                              textwidget(text: "${item['subtitle']}",
                                  fontszie: 16.45.sp, fonweight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255,
                                      255, 0.9)),
                              SizedBox(height: 1.h),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(98,
                                      90, 250, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: textwidget(text: "Buy Now",
                                    fontszie: 16.5.sp, fonweight: FontWeight.w600,
                                    color: Color.fromRGBO(255, 255,
                                        255, 0.98)),
                              ),
                            ],
                          ),
                        ),
                        // Page indicator
                        // Positioned(
                        //   bottom: 8.0,
                        //   right: 16.0,
                        //   child: Row(
                        //     children: List.generate(sliderData.length, (dotIndex) {
                        //       return Container(
                        //         margin: EdgeInsets.symmetric(horizontal: 4.0),
                        //         width: index == dotIndex ? 10.0 : 8.0,
                        //         height: index == dotIndex ? 10.0 : 8.0,
                        //         decoration: BoxDecoration(
                        //           color: index == dotIndex
                        //               ? Colors.blue
                        //               : Colors.blue.withOpacity(0.5),
                        //           shape: BoxShape.circle,
                        //         ),
                        //       );
                        //     }),
                        //   ),
                        // ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 18.5.h,
            left: 43.w,
            child: SmoothPageIndicator(
              controller: pageController,
              count: sliderdetails.length, // Use the length of the slider details
              effect: ScrollingDotsEffect(
                dotWidth: 1.7.w,
                dotHeight: .8.h,
                dotColor: Colors.grey.shade400,
                activeDotColor: Color.fromRGBO(0, 122, 255, 1),
                radius: 30.sp, // Makes the dots circular
              ),
            ),
          ),
        ],
      ),
    );
  }
}
