import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final PageController pageController = PageController();
final List pageViewImage = [
  "assets/1.jpg",
  "assets/2.jpg",
  "assets/3.jpg",
];

final List images = [
  "assets/18.png",
  "assets/7.png",
  "assets/12.png",
  "assets/17.png",
];
final List tilteList = [
  "Nescafr Coffe Jar",
  "Modern Office Chair",
  'Beach Sunglasses',
  'Meow Mix Cat Food',
];
List<Color> coluors = [
  const Color.fromRGBO(0, 147, 118, 0.5),
  Colors.transparent,
  const Color.fromRGBO(162, 0, 80, 0.5),
];
final List text = [
  'Amazon'
      'Amazon2'
      'Amazon3'
];
List<Map<String, String>> sliderdetails = [
  {'image': "assets/1.jpg", 'text': 'Amazon Echo\n3rd Generation, Charcoal'},
  {'image': "assets/2.jpg", 'text': 'Amazon2 Echo\n3rd Generation, Charcoal'},
  {'image': "assets/3.jpg", 'text': 'Amazon3 Echo\n3rd Generation, Charcoal'},
];

// ///Category Data List & Category2
// final List<Map<String, dynamic>> categoryDataList1 = [
//   {
//     "image": 'assets/woman-clothes.png',
//     'text': 'Womens \n Fashion',
//     'title': 'Womens Fashion'
//   },
//   {
//     "image": 'assets/grocery.png',
//     'text': 'Groceries &\n Pets',
//     'title': 'Groceries & Pets'
//   },
//   {
//     "image": 'assets/shampoo.png',
//     'text': 'Health &\n Beauty',
//     'title': 'Health & Beauty'
//   },
//   {
//     "image": 'assets/rowboat.png',
//     'text': 'Sports &\n Outdoors',
//     'title': 'Sports & Outdoors'
//   },
//   {
//     "image": 'assets/tv-table.png',
//     'text': 'Home & \nAppllance',
//     'title': 'Home Appllance',
//   },
//   {
//     "image": 'assets/beach.png',
//     'text': 'Tour & \n Travels',
//     'title': 'Tour & Travels',
//   },
//   {
//     "image": 'assets/baby-products.png',
//     'text': 'Mother & \n Baby',
//     'title': 'Mother & Baby',
//   },
//   {
//     "image": 'assets/price-tag.png',
//     'text': 'Clearance\n Sale',
//     'title': 'Clearance Sale',
//   },
// ];
// List<Map<String, dynamic>> categoryDataList2 = [
//   {
//     "image": 'assets/tv-table.png',
//     'text': 'Home & \nAppllance',
//     'title': 'Home Appllance',
//   },
//   {
//     "image": 'assets/beach.png',
//     'text': 'Tour & \n Travels',
//     'title': 'Tour & Travels',
//   },
//   {
//     "image": 'assets/baby-products.png',
//     'text': 'Mother & \n Baby',
//     'title': 'Mother & Baby',
//   },
//   {
//     "image": 'assets/price-tag.png',
//     'text': 'Clearance\n Sale',
//     'title': 'Clearance Sale',
//   },
// ];

/// cyclone offer widget's List
List<Map<String, dynamic>> cycloneOfferItems = [
  {'value': 0.33, 'asset': 'assets/1.png', 'title': 'Black Table Lamp'},
  {'value': 0.7, 'asset': 'assets/2.png', 'title': 'White Table Lamp'},
  {'value': 0.8, 'asset': 'assets/3.png', 'title': 'Modern Table Lamp'},
  {'value': 0.33, 'asset': 'assets/1.png', 'title': 'Black Table Lamp'},
  {'value': 0.7, 'asset': 'assets/2.png', 'title': 'White Table Lamp'},
  {'value': 0.8, 'asset': 'assets/3.png', 'title': 'Modern Table Lamp'},
];
final List horizontalProductList = [
  {'image': "assets/images/boss.png", 'text': 'Furniture'},
  {'image': "assets/images/shoe.png", 'text': 'Shoes'},
  {'image': "assets/images/shirts.png", 'text': 'Cloths'},
];

final List<String> autoSliderImage = [
  'assets/10.jpg',
  'assets/6.jpg',
  'assets/11.jpg',
];
final List<Map<String, dynamic>> rImages = [
  {
    'image': 'assets/images/bmen2.png',
  },
  {'image': 'assets/images/bwomen.jpg'},
  {'image': 'assets/images/men.jpg'},
];

final List<Map<String, dynamic>> rText = [
  {
    'title': 'Very good product. It is just amazing',
    'subtitle': 'Designing World 12 Dec 2024'
  },
  {
    'title': 'Very excellent product. Love it.',
    'subtitle': 'Designing World 8 Dec 2024'
  },
  {
    'title': 'What a nice product it is. I am looking it is.',
    'subtitle': 'Designing World 28 Nov 2024'
  },
];
