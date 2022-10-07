import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class CustomeTextWidgetOptions extends StatefulWidget {
  String text;
  double fontSize;
  Color? font_color;
  CustomeTextWidgetOptions(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.font_color = Constants.whiteColor})
      : super(key: key);

  @override
  _CustomeTextWidgetOptionsState createState() =>
      _CustomeTextWidgetOptionsState();
}

class _CustomeTextWidgetOptionsState extends State<CustomeTextWidgetOptions> {
  @override
  Widget build(BuildContext context) {
    return Text('${widget.text}',
        style: TextStyle(color: widget.font_color, fontSize: widget.fontSize));
  }
}
