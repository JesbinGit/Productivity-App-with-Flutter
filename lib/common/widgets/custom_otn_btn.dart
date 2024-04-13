import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOtlnBtn extends StatelessWidget {
  const CustomOtlnBtn(
      {super.key,
      this.onTap,
      required this.width,
      required this.height,
      this.color2,
      required this.text,
      required this.color});

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(1),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
              color: color2,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1, color: color)),
          child: Center(
            child: ReusableText(
                text: text, style: appstyle(18, color, FontWeight.bold)),
          ),
        ));
  }
}
