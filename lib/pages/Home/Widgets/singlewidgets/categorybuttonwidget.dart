
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? ontap;
  const CategoryWidget({
    super.key, required this.image, required this.text, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 1.5.h),
        child: Center(
          child: Container(
            height: 14.h,
            width: 22.w,
            decoration: BoxDecoration(
                color: Color.fromRGBO(36,38, 68, 1),
                borderRadius: BorderRadius.circular(12.sp)
            ),


            child: Column(
              children: [
                Image.asset(image,height:8.h,width: 10.5.w,),
                regularfont(text: text, fontsize: 15.sp, color: Color.fromRGBO(116, 119, 148,0.8),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class regularfont extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;

  const regularfont({
    super.key,
    required this.text, required this.fontsize, required this.color,
  });



  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontWeight: FontWeight.w700,
        fontFamily:"PlusJakartaSans-Regular.ttf",fontSize: fontsize ),textAlign: TextAlign.center,);
  }
}