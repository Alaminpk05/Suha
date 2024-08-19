import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constant.dart';


class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  PageController pageController = PageController();
  int currentindex = 0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.sp),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 3.w, right: 3.w, top: 2.h, bottom: 1.h),
            child: Container(
              height: 21.h,
              width: double.infinity,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                child: PageView.builder(
                  allowImplicitScrolling: true,
                  reverse: false,
                  dragStartBehavior: DragStartBehavior.down,
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentindex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    final realIndex = index % sliderdetails.length;
                    return Image.asset(
                      pageViewImage[realIndex],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                 // Specify the number of items
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
