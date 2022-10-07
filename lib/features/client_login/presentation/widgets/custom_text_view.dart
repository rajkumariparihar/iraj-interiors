import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class CustomTextView extends StatefulWidget {
  void Function()? onTap;
  TextAlign? textAlign;
  String text;
  CustomTextView({Key? key, required this.text, this.onTap, this.textAlign})
      : super(key: key);

  @override
  _CustomTextViewState createState() => _CustomTextViewState();
}

class _CustomTextViewState extends State<CustomTextView> {
  @override
  Widget build(BuildContext context) {
    return widget.onTap != null
        ? InkWell(
            onTap: widget.onTap,
            child: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ))
        : Text(
            widget.text,
            textAlign: widget.textAlign,
            style: const TextStyle(color: Constants.primaryDarkColor),
          );
  }
}
