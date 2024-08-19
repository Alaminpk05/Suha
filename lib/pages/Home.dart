

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shuhaui/pages/cart.dart';
import 'package:shuhaui/pages/chat.dart';
import 'package:shuhaui/pages/pages.dart';
import 'package:shuhaui/pages/settins.dart';
import 'package:shuhaui/widgets/categorybuttonwidget.dart';
import 'package:shuhaui/widgets/cycloneoffer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  final PageController pageController=PageController();
final List _image=[
  "assets/1.jpg",
  "assets/2.jpg",
  "assets/3.jpg",

];
final List images=[
  "assets/18.png",
  "assets/7.png",
  "assets/12.png",
  "assets/17.png",

];
final List tilteList=[
  "Nescafr Coffe Jar",
  "Modern Office Chair",
  'Beach Sunglasses',
  'Meow Mix Cat Food',

];
List<Color>coluors=[
  const Color.fromRGBO(0,147, 118,0.5),
  Colors.transparent,
  const Color.fromRGBO(162,0,80,0.5),
  ];
final List text=[
  'Amazon'
  'Amazon2'
  'Amazon3'
];
  List<Map<String,String>> sliderdetails=[
    {'image':"assets/1.jpg",
      'text':'Amazon Echo\n3rd Generation, Charcoal'

    },{
      'image':"assets/2.jpg",
      'text':'Amazon2 Echo\n3rd Generation, Charcoal'

    },{'image':"assets/3.jpg",

      'text':'Amazon3 Echo\n3rd Generation, Charcoal'

    },
  ];


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
    timer!.cancel();
    setState(() {
      started=false;
    });
  }
  void reset(){
    timer!.cancel();
    setState(() {
      seconds=0;minutes=0;hour=0;day=0;
      digitSeconds='00';digitMinutes='00';digitHours='00';digitDays='00';
    });
  }
  // void addLaps(){
  //   String lap='$digitSeconds:$digitMinutes:$digitHours:$digitDays';
  //   setState(() {
  //     laps.add(lap);
  //   });
  // }

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
                          return Image.asset(_image[realIndex],fit: BoxFit.cover,width: double.infinity,);

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
              /// switch Image
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
                    const ViewProductlist( productListviewTitle: 'Top Products',),
                    Row(
                      children: [
                        topProductwithtime(name: "Beach Cap", image:"assets/11.png", miniButtonword:"Sale",
                            miniButtoncolor: const Color.fromRGBO(255, 175, 0,1), color: Colors.black),
                        topProductwithouttime(name: 'Wooden Sofa', photo:"assets/5.png", color: Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New' ),
                      ],
                    ),Row(
                      children: [

                        topProductwithouttime(name: "Roof Lamp", photo:"assets/6.png", color: Color.fromRGBO(0,184,148, 1), minibuttonword2: 'New' ),
                        topProductwithtime(name:"Sneaker Shoes", image: "assets/9.png", miniButtonword:"-18%", miniButtoncolor: Colors.redAccent, color:Colors.white ),
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
            child: const ViewProductlist(productListviewTitle: 'Weekly Best Sellers',),
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

   Widget topProductwithtime({required name, required image,required miniButtonword, required Color miniButtoncolor,required color}) {
    return Stack(
      children: [
        Container(
          height: 30.h,
          width: 45.w,
          margin: EdgeInsets.only(top: 0.5.h, left: 0.5.w, right: 1.h, bottom: 0.5.h),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(36, 38, 68, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 3.h,
          left: 4.w,
          right: 3.5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 2.h,
                width: 9.5.w,
                decoration: BoxDecoration(
                  color:miniButtoncolor,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Center(
                  child: Text(
                    miniButtonword,
                    style: TextStyle(
                      color:color,
                      fontWeight: FontWeight.w400,
                      fontFamily: "PlusJakartaSans-Regular.ttf",
                      fontSize: 13.5.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
                width: 10.w,
                child: Image.asset('assets/heart (3).png', fit: BoxFit.contain),
              ),
            ],
          ),
        ),
        Positioned(
          top: 3.5.h,
          left: 10.w,
          child: Center(child: Image.asset(image, width: 25.w)),
        ),
        Positioned(
          top: (30.h - 3.h) / 2, // Center vertically within the parent height
          left: (45.w - 30.w) / 2, // Center horizontally within the parent width
          child: Container(
            height: 2.5.h,
            width: 27.w,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 175, 0, 1),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Center(
              child: textwidget(
                text: "${digitDays}d ${digitHours}h ${digitMinutes}m ${digitSeconds}s",
                fontszie: 13.5.sp,
                fonweight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),

        Positioned(
          top: 17.h,
          left: 4.w,
          child: regularfont(
            text: name,
            fontsize: 16.sp,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 19.5.h,
          left: 3.w,
          right: 2.w,
          child: Row(
            children: [
              Text(
                "\$7.99",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$15",
                style: TextStyle(
                  color: const Color.fromRGBO(116, 119, 148, 1),
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: const Color.fromRGBO(116, 119, 148, 1),
                  decorationThickness: 0.3.h,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 2.h,
          left: 3.3.w,
          right: 5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 0.7.w),
                    child: Image.asset(
                      'assets/star.png',
                      height: 2.5.h,
                      width: 2.5.w,
                    ),
                  );
                }),
              ),
              Container(
                height: 4.h,
                width: 4.h, // Use 4.h for both dimensions to maintain the circle
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Image.asset('assets/plus.png',height: 2.h,width: 2.h,)),
              ),
            ],
          ),
        ),
      ],
    );

  }
  Widget topProductwithouttime({required String name,required String photo,required Color color,required String minibuttonword2}) {

    return Stack(
      children: [
        Container(
          height: 30.h,
          width: 45.w,
          margin: EdgeInsets.only(top: 0.5.h, left: 0.5.w, right: 1.h, bottom: 0.5.h),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(36, 38, 68, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 3.h,
          left: 6.w,
          child: Center(child: Image.asset(photo, width: 28.w)),
        ),
        Positioned(
          top: 3.h,
          left: 4.w,
          right: 3.5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 2.h,
                width: 9.5.w,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Center(
                  child: Text(
                  minibuttonword2,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "PlusJakartaSans-Regular.ttf",
                      fontSize: 13.5.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
                width: 10.w,
                child: Padding(
                  padding: EdgeInsets.only(right: 0.7.w
                  ),
                  child: Image.asset('assets/heart (3).png', height: 2.5.h,width: 2.5.w
                    ,),
                ),
              ),
            ],
          ),
        ),



        Positioned(
          top: 17.h,
          left: 3.w,
          child: regularfont(
            text: name,
            fontsize: 16.sp,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 19.5.h,
          left: 3.w,
          right: 2.w,
          child: Row(
            children: [
              Text(
                "\$74",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 1.w),
              Text(
                "\$99",
                style: TextStyle(
                  color: const Color.fromRGBO(116, 119, 148, 1),
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: const Color.fromRGBO(116, 119, 148, 1),
                  decorationThickness: 0.3.h,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 2.h,
          left: 3.3.w,
          right: 5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Image.asset(
                    'assets/star.png',
                    height: 2.5.h,
                    width: 2.5.w,
                  );
                }),
              ),
              Container(
                height: 4.h,
                width: 4.h, // Use 4.h for both dimensions to maintain the circle
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Image.asset('assets/plus.png',height: 2.h,width: 2.h,)),
              ),
            ],
          ),
        ),
      ],
    );


  }
}

class WeeklyProductsCard extends StatelessWidget {
  final String image;
  final String title;
  const WeeklyProductsCard({
    super.key, required this.image, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.5.w,vertical: 0.5.h),
      height: 12.h,

      decoration: BoxDecoration(
        color: const Color.fromRGBO(36, 38, 68,1), // Use the passed container color
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 1.h,bottom: 1.h
            ),
            height: double.infinity,
            width: 25.w,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: const Color.fromRGBO(51,40,88, 1)

            ),
            child: Stack(
              children:[
                Positioned(




                child: Container(
                  height: 22.h,
                  width: 19.w,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,



                  ),
                ),
              ),

                Positioned(
                  left: 1.w,
                  bottom: 6.1.h,


                  child: Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(36, 38, 68,1),
                        shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.5.sp),
                      child: Image.asset(
                        'assets/heart (3).png',
                        height: 3.h,
                        width: 3.w,


                      ),
                    ),
                  ),
                ),
                ]
            ),

          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 1.8.h,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      const Text(
                        '\$54',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '\$64',
                        style: TextStyle(
                          color: Color(0xFFDC3545),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "4.88",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),Text(
                        " (125 Reviews",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ViewProductlist extends StatelessWidget {
  final String productListviewTitle;
  const ViewProductlist({
    super.key, required this.productListviewTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 1.h,bottom: 1.h,right: 4.w,left: 1.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        regularfont(text:productListviewTitle, fontsize:  17.5.sp, color: Colors.white,)
        ,
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(36, 38, 68, 1),
                minimumSize: Size(0.w,4.1.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp))
              ),

              child: Row(

                children: [
                  regularfont(text: "View all", fontsize: 15.sp,
                      color: Colors.white),
                  SizedBox(width: 2.w,),
                  Image.asset('assets/arrow-narrow-right.png',height: 3.h,width: 3.w,)
                ],
              ))
        ],
      ),
    );
  }
}

class textwidget extends StatelessWidget {
  final String text;
  final double fontszie;
  final FontWeight fonweight;
  final Color color;
  const textwidget({
    super.key, required this.text,
    required this.fontszie,
    required this.fonweight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontWeight:fonweight,
      color: color,
      fontSize: fontszie,
    ));
  }
}

