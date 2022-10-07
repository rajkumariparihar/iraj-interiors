import 'package:flutter/material.dart';

class CustomSizedBoxes extends StatefulWidget {
  double? height, width;
  CustomSizedBoxes({Key? key, this.height, this.width}) : super(key: key);

  @override
  _CustomSizedBoxesState createState() => _CustomSizedBoxesState();
}

class _CustomSizedBoxesState extends State<CustomSizedBoxes> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
    );
  }
}
