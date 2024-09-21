import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/utils/respnsive_helper.dart';
import '../../../../utils/constant.dart';
import '../singlewidgets/cycloneofferCard.dart';

class CycloneOfferSection extends StatefulWidget {
  const CycloneOfferSection({
    super.key,
    required this.digitDays,
    required this.digitHours,
    required this.digitMinutes,
    required this.digitSeconds,
  });

  final String digitDays;
  final String digitHours;
  final String digitMinutes;
  final String digitSeconds;

  @override
  State<CycloneOfferSection> createState() => _CycloneOfferSectionState();
}

class _CycloneOfferSectionState extends State<CycloneOfferSection> {
  late ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Mobile = ResponsiveHelper.isMobile(context);
    var Tablet = ResponsiveHelper.isTablet(context);
    return SizedBox(
     
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: .0.w, right:1.5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cyclone Offer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${widget.digitDays}d ${widget.digitHours}h ${widget.digitMinutes}m ${widget.digitSeconds}s",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Mobile?17.sp:15.5.sp,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Mobile?1.h:0,
          ),
          SizedBox(
              height: 46.5.w,
              width: 100.w,
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollController,
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: null,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      final realIndex = index % cycloneOfferItems.length;
                      final item = cycloneOfferItems[realIndex];

                      return CycloneOfferWidget(
                        value: item['value'],
                        asset: item['asset'],
                        title: item['title'],
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
