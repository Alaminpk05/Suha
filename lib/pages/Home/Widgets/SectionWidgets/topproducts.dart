import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../singlewidgets/topProductwithouttime.dart';
import '../singlewidgets/topproductswithcountdownCard.dart';
import '../singlewidgets/viewallButton.dart';



class TopProductsSection extends StatelessWidget {
  const TopProductsSection({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w,),
      child: Column(
        children: [
          ViewProductlist( productListviewTitle: 'Top Products',
            ontab: () {  },),
          Row(
            children: [
              topProductwithtime(name: "Beach Cap", image:"assets/11.png", miniButtonword:"Sale",
                  miniButtoncolor: const Color.fromRGBO(255, 175, 0,1), color: Colors.black, digitDays: digitDays, digitHours: digitHours,
                  digitMinutes: digitMinutes, digitSeconds: digitSeconds),
              topProductwithouttime(name: 'Wooden Sofa', photo:"assets/5.png", color: const Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New' ),
            ],
          ),Row(
            children: [

              topProductwithouttime(name: "Roof Lamp", photo:"assets/6.png", color: const Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New' ),
              topProductwithtime(name:"Sneaker Shoes", image: "assets/9.png", miniButtonword:"-18%", miniButtoncolor: Colors.redAccent, color:Colors.white,
                  digitDays: digitDays, digitHours: digitHours, digitMinutes: digitMinutes, digitSeconds: digitSeconds ),
            ],
          ),
        ],
      ),
    );
  }
}