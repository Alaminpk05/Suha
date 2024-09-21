import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/features/home/Widgets/singlewidgets/textwidget.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constant.dart';


class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

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
    var mobile = ResponsiveHelper.isMobile(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        SizedBox(
          height: 20.h,
          width: double.infinity,
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(mobile?15.sp:12)),
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
                      left: mobile?7.w:4.w,
                      bottom: mobile?4.3.h:6.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textwidget(text: "${item['title']}",
                              fontszie: mobile?20.5.sp:20.sp, fonweight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255,
                                  255, 0.95)),
                          SizedBox(height: mobile?0.3.h:0.5.h),
                          textwidget(text: "${item['subtitle']}",
                              fontszie: mobile?16.45.sp:15.30.sp, fonweight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255,
                                  255, 0.9)),
                          SizedBox(height: mobile?1.h:1.30.h),
                          ElevatedButton(
                            
                            onPressed: () {
                              // Handle button press
                            },
                            style: ElevatedButton.styleFrom(
                              
                              
                              backgroundColor: const Color.fromRGBO(98,
                                  90, 250, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0.sp),
                              ),
                            ),
                            child: textwidget(text: "Buy Now",
                                fontszie: mobile?16.5.sp:14.5.sp, fonweight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255,
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
        Positioned(
          top: mobile?18.h:18.5.h,
          left: mobile?43.w:30.w,
          child: SmoothPageIndicator(
            controller: pageController,
            count: sliderdetails.length, // Use the length of the slider details
            effect: ScrollingDotsEffect(
              dotWidth: mobile?1.7.w:0.9.w,
              dotHeight: mobile?0.8.h:0.6.h,
              dotColor: Colors.grey.shade400,
              activeDotColor: const Color.fromRGBO(0, 122, 255, 1),
              radius: 30.sp, // Makes the dots circular
            ),
          ),
        ),
      ],
    );
  }
}
