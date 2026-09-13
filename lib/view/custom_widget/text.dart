import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.maxLine,
    this.color,
    this.fSize,
    this.fWeight,
    this.tOverflow,
    this.tDecoration,
  });
  String text;
  int? maxLine;
  Color? color;
  double? fSize;
  FontWeight? fWeight;
  TextOverflow? tOverflow;
  TextDecoration? tDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? 1,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fSize ?? 12,
        fontWeight: fWeight ?? FontWeight.w400,
        overflow: tOverflow ?? TextOverflow.ellipsis,
        decoration: tDecoration ?? TextDecoration.none,
      ),
    );
  }
}
