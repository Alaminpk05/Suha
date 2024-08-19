// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class ImageSlider extends StatefulWidget {
//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }
//
// class _ImageSliderState extends State<ImageSlider> {
//   final PageController _pageController = PageController(initialPage: 1000);
//   final List<Map<String, String>> _images = [
//     {
//       'image': 'assets/1.png',
//       'text': 'This is the first image',
//     },
//     {
//       'image': 'assets/2.png',
//       'text': 'This is the second image',
//     },
//     {
//       'image': 'assets/3.png',
//       'text': 'This is the third image',
//     },
//   ];
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding:  EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w
//         ),
//         child: PageView.builder(
//           controller: _pageController,
//           itemBuilder: (context, index) {
//             // Real index to make it loop
//             final realIndex = index % _images.length;
//             return Stack(
//               children: [
//                 Center(
//                   child: Image.asset(
//                     _images[realIndex]['image']!,
//                     fit: BoxFit.cover,
//                     width: 20.w,
//                     height: 20.h,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 50.h,
//                   left: 20,
//                   child: Text(
//                     _images[realIndex]['text']!,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       backgroundColor: Colors.black45,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//           onPageChanged: (index) {
//             // Optionally, handle page change events here
//           },
//         ),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: ImageSlider(),
// //     );
// //   }
// // }
// //
// // class ImageSlider extends StatefulWidget {
// //   @override
// //   _ImageSliderState createState() => _ImageSliderState();
// // }
// //
// // class _ImageSliderState extends State<ImageSlider> {
// //   // Initialize the page controller with a large initial page
// //   final PageController _pageController = PageController(initialPage: 1000);
// //
// //   // List of image paths to be displayed in the containers
// //   final List<String> _images = [
// //     'assets/images/image1.png',
// //     'assets/images/image2.png',
// //     'assets/images/image3.png',
// //   ];
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: PageView.builder(
// //         controller: _pageController,
// //         itemBuilder: (context, index) {
// //           // Calculate the real index using modulo to loop
// //           final realIndex = index % _images.length;
// //
// //           return Container(
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage(_images[realIndex]),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             child: Center(
// //               child: Text(
// //                 'Image ${realIndex + 1}',
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.bold,
// //                   backgroundColor: Colors.black45,
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //         onPageChanged: (index) {
// //           // Optionally, handle page change events here
// //         },
// //       ),
// //     );
// //   }
// // }
//
