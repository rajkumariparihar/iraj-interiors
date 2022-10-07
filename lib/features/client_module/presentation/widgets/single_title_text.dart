import 'package:flutter/material.dart';

class SingleTitleText extends StatefulWidget {
  String title;
  double fontSize;
  FontWeight? fontWeight = FontWeight.w700;

  SingleTitleText(
      {Key? key, required this.title, required this.fontSize, this.fontWeight})
      : super(key: key);

  @override
  _SingleTitleTextState createState() => _SingleTitleTextState();
}

class _SingleTitleTextState extends State<SingleTitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.title} ',
      style:
          TextStyle(fontSize: widget.fontSize, fontWeight: widget.fontWeight),
    );
  }
}
