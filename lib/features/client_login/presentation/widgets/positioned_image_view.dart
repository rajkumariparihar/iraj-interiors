import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class PositionedImageView extends StatefulWidget {
  double? left, right, height, width, top;
  String image_url;
  PositionedImageView(
      {Key? key,
      this.left,
      this.top,
      this.width,
      this.right,
      this.height,
      required this.image_url})
      : super(key: key);

  @override
  _PositionedImageViewState createState() => _PositionedImageViewState();
}

class _PositionedImageViewState extends State<PositionedImageView> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      right: widget.right,
      top: widget.top,
      width: widget.width,
      height: widget.height,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: (widget.image_url == Constants.image_clock)
                ? const BorderRadius.all(Radius.circular(20))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
        margin: EdgeInsets.zero,
        elevation: 10,
        color: Constants.primaryDarkColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.image_url))),
          ),
        ),
      ),
    );
  }
}
