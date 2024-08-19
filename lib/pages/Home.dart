

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/widgets/categorybuttonwidget.dart';
import 'package:shuhaui/widgets/cycloneofferCard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/constant.dart';
import '../widgets/textwidget.dart';
import '../widgets/topProductwithouttime.dart';
import '../widgets/topproductswithcountdownCard.dart';
import '../widgets/viewallButton.dart';
import '../widgets/weeklybestsellerscard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  final PageController pageController=PageController();


  int index=0;
  bool switchValue=false;
  int currentindex=0;
  ///logi for countdown
  int seconds=60,minutes=60,hour=24,day=10;
  String digitSeconds='60',digitMinutes='60',digitHours='24',digitDays='10';
  Timer? timer;
  bool started=true;
  List laps=[];
  void stop(){
    if(day==0&& hour==0&& minutes==0&& seconds==0){
      timer!.cancel();
      setState(() {
        started=false;
      });
    }

  }
  void reset(){
    timer!.cancel();
    setState(() {
      seconds=0;minutes=0;hour=0;day=0;
      digitSeconds='00';digitMinutes='00';digitHours='00';digitDays='00';
    });
  }


  ///Creating the started timer function
  void start(){
    started=true;
    timer=Timer.periodic(const Duration(seconds: 1),(timer){
      int localSeconds =seconds-1;
      int localMinutes=minutes;
      int localHours=hour;
      int localDays=day;
      if(localSeconds<1){
        if(localMinutes<1){
          if(localHours<1){
            localDays--;
            localHours=24;
          }else{
            localHours--;
            localMinutes=60;
          }

        }else{
          localMinutes--;
          localSeconds=60;
        }
      }
      setState(() {
        seconds=localSeconds;
        minutes=localMinutes;
        hour=localHours;
        digitSeconds=(seconds>=10)?'$seconds':"0$seconds";
        digitMinutes=(minutes>=10)?'$minutes':"0$minutes";
        digitHours=(hour>=10)?'$hour':"0$hour";
        digitDays=(day>=10)?'$day':"0$day";
        print(timer);


      });
    });

  }
  @override
  void initState() {
    start();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        leading:Padding(
          padding:  EdgeInsets.only(left: 4.w,bottom: 0.5.h),
          child:  Image.asset("assets/logo-small.png",fit: BoxFit.contain,),
        ),

        actions: [
          Padding(
            padding:  EdgeInsets.all(3.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  child: Image.asset(
                    height: 4.20.h,"assets/basket (1).png",fit: BoxFit.cover,),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.5.w,),

          Container(
            height: 9.h,
            width: 7.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/9.jpg'),fit:BoxFit.contain,),
            ),



          ),

          SizedBox(width: 2.5.w,),
          GestureDetector(
            onTap: (){


            },
            child: Container(
            height: 3.h,
    width: 8.50.w,
              child: Image.asset(
                height: 3.h,"assets/menu-2.png",fit: BoxFit.contain,),
            ),
          ),
          SizedBox(width: 4.w,)
        ],



      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 2.50.h,left: 3.w
                    ),
                    child: Container(
                      height: 5.50.h,
                      width: 79.w,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(51, 40, 88, 1),
                        borderRadius: BorderRadius.circular(13.sp)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/search.png',height:3.h,width: 6.w,),
                            SizedBox(width: 3.w,),
                            Expanded(child: TextFormField(

                              decoration: const InputDecoration(
                                hintText: "Search in Suha",
                              hintStyle: TextStyle(color: Color.fromRGBO(153,172,148,0.7)),
                              border: InputBorder.none
                                )

                              ,
                            ))


                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(width: 3.w,),
                  Padding(
                    padding:  EdgeInsets.only(top: 2.50.h
                    ),
                    child: Container(

                      width: 27.sp,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(11, 94, 217, 1),
                        borderRadius: BorderRadius.circular(12.sp)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/adjustments-horizontal (1).png',fit: BoxFit.contain,),
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding:  EdgeInsets.all(3.sp),
                child: Stack(
                  fit: StackFit.passthrough,

                    children: [


                   Padding(
                    padding:  EdgeInsets.only(left: 3.w,right: 3.w,
                    top: 2.h,bottom: 1.h),
                    child: Container(

                      height: 21.h,
                      width:double.infinity,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                        child: PageView.builder(
                          allowImplicitScrolling: true,

                          reverse: false,
                            dragStartBehavior: DragStartBehavior.down,
                            controller: pageController,
                            onPageChanged: (value){
                            setState(() {
                              currentindex=value;
                            });
                            },

                            itemBuilder: (context,index){
                              final realIndex = index % sliderdetails.length;
                          return Image.asset(pageViewImage[realIndex],fit: BoxFit.cover,width: double.infinity,);

                        }),
                      ),
                    ),
                  ),
                      Positioned(
                        top: 18.5.h,
                        left: 43.w,

                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: ScrollingDotsEffect(
                            dotWidth: 1.7.w,
                            dotHeight: .8.h,
                            dotColor: Colors.grey.shade400,

                            activeDotColor:Color.fromRGBO(0, 122, 255, 1),
                            radius: 30.sp, // Makes the dots circular

                          ),
                        ),)









                ]
                ),
              ),
              ///Category
              Padding(
                padding:  EdgeInsets.only(left: 1.2.w,right:1.2.w,top: 0.5.h,bottom: 0.5.h),
                child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CategoryWidget(image: 'assets/woman-clothes.png', text: 'Womens \n Fashion',),
                    CategoryWidget(image: 'assets/grocery.png', text: 'Groceries &\n Pets',),
                    CategoryWidget(image: 'assets/shampoo.png', text: 'Health &\n Beauty',),
                    CategoryWidget(image: 'assets/rowboat.png', text: 'Sports &\n Outdoors',),




                  ],
                ),
              ),Padding(
                padding:  EdgeInsets.only(left: 1.w,right: 1.w),
                child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CategoryWidget(image: 'assets/tv-table.png', text: 'Home\n Application',),

                    CategoryWidget(image: 'assets/beach.png', text: 'Tour & \n Travels',),
                    CategoryWidget(image: 'assets/baby-products.png', text: 'Mother & \n Baby',),
                    CategoryWidget(image: 'assets/price-tag.png', text: 'Clearance\n Sale',),


                  ],
                ),
              ),
///Cyclone Offer
              Container(
                padding: EdgeInsets.only(top: 1.5.h,left: 2.8.w,right: 1.w,bottom: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: .6.w
                          ,right:3.2.w ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cyclone Offer",style: TextStyle(color: Colors.white,
                              fontSize: 17.sp,fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,),
                          Text("${digitDays}d ${digitHours}h ${digitMinutes}m ${digitSeconds}s",style: TextStyle(color: Colors.white,
                              fontSize: 17.sp,fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,),

                        ],
                      ),
                    ),

                    Container(
                      height: 46.5.w,width:100.w,
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,

                          itemBuilder: (context,indx){

                            return const Row(

                              children: [
                                CycloneOfferWidget(value: 0.33, asset: 'assets/1.png',
                                  title: 'Black Table Lamp',),
                                CycloneOfferWidget(value: 0.7, asset: 'assets/2.png',
                                  title: 'Black Table Lamp',),
                                CycloneOfferWidget(value: 0.8, asset: 'assets/3.png',
                                  title: 'Black Table Lamp',),
                              ],
                            );
                          }),
                    )


                  ],
                ),
              ),
              /// Theme Changing switch & Image
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5) , BlendMode.dstATop),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.5.w),

                  height: 21.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/dark.jpg'),
                        filterQuality: FilterQuality.high,fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 7.w,bottom: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [



                        Text("You can change your display to a dark "
                            "\n background using a dark mode.",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily:"PlusJakartaSans-Regular.ttf",

                              fontSize: 16.sp ),textAlign: TextAlign.start,),
                        Switch(
                            activeColor: Colors.purple,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: const Color.fromRGBO(12, 21, 59, 1),

                            value: switchValue,

                            onChanged:(value){

                            })
                      ],
                    ),
                  ),
                ),
              ),
              /// Top Products
              Padding(
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
                        topProductwithouttime(name: 'Wooden Sofa', photo:"assets/5.png", color: Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New' ),
                      ],
                    ),Row(
                      children: [

                        topProductwithouttime(name: "Roof Lamp", photo:"assets/6.png", color: Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New' ),
                        topProductwithtime(name:"Sneaker Shoes", image: "assets/9.png", miniButtonword:"-18%", miniButtoncolor: Colors.redAccent, color:Colors.white,
                            digitDays: digitDays, digitHours: digitHours, digitMinutes: digitMinutes, digitSeconds: digitSeconds ),
                      ],
                    ),
                  ],
                ),
              ),
          /// DISCOUNT CARD

          Container(
            height:21.h,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFDC3545), // Dark red color
                  Color(0xFFFF5B5E), // Lighter reddish-pink color
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              // Background color matching the image
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: Stack(
              children: [
                // Positioned for the brush image on the right
                Positioned(
                  top: 5.h,
                  right: 0.w,
                  bottom:0.h,
                  child: Image.asset(
                    'assets/make-up.png', // Your image path here
                    height: 18.h,
                    width: 20.w
                    ,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textwidget(text: "20% discount on\nwomen care items.",
                          fontszie: 19.5.sp,
                          fonweight: FontWeight.w600,
                          color: Colors.white),
                      SizedBox(height: 0.4.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(

                          backgroundColor: const Color.fromRGBO(98,90,250,1), // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp), // Button corners
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: const Text(
                          'Grab this offer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white, // Button text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
              /// WEEKLY BEST SELLERS
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child:  ViewProductlist(productListviewTitle: 'Weekly Best Sellers', ontab: () {  },),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context,index){
            return  Column(
              children: [

                WeeklyProductsCard(image: images[index], title:tilteList[index] ,),


              ],
            );},
          )
            ],
          ),
        ),
      ),




    );
  }



}

