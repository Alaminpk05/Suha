import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/Home/home_view.dart';
import 'package:shuhaui/pages/cart.dart';
import 'package:shuhaui/pages/chat.dart';
import 'package:shuhaui/pages/pages.dart';
import 'package:shuhaui/pages/settins.dart';

class Tabapges extends StatefulWidget {
  const Tabapges({super.key});

  @override
  State<Tabapges> createState() => _TabapgesState();
}

class _TabapgesState extends State<Tabapges> {
  int index=0;
  List<Map<String, dynamic>> pagedetails = [
    {

      'page': const HomeScreen(),
    },
    {

      'page': const Chat(),
    },
    {

      'page': const Cart(),
    }, {

      'page': const Settings(),
    }, {

      'page': const Pages(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: pagedetails[index]['page'],
      bottomNavigationBar: BottomNavBar(),
    );
  }

  BottomNavigationBar BottomNavBar() {
    return BottomNavigationBar(
        currentIndex: index,
        unselectedFontSize: 13.sp,
        selectedFontSize: 13.sp,
        onTap: (value){
          setState(() {
            index=value;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 12.sp,

        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,


        items: <BottomNavigationBarItem>[


          BottomNavigationBarItem(icon: Image.asset('assets/home (1).png',color: Colors.white,height: 3.h,),label: "Home"),
          BottomNavigationBarItem(icon: Image.asset('assets/message (1).png',color: Colors.white,height: 3.h,),label: "Chat",),
          BottomNavigationBarItem(icon: Image.asset('assets/message (1).png', color: Colors.white,height: 3.h,),label: "Cart",),

          BottomNavigationBarItem(icon: Image.asset('assets/settings (1).png',color: Colors.white,height: 3.h, ),label: "Settings"),
          BottomNavigationBarItem(icon: Image.asset('assets/heart (1).png',fit: BoxFit.contain,color: Colors.white,height: 3.h, ),label: "Pages"),


        ]);
  }
}
