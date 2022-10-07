import 'package:flutter/material.dart';

class PositionedTextView extends StatefulWidget {
  String text;
  PositionedTextView({Key? key, required this.text}) : super(key: key);

  @override
  _PositionedTextViewState createState() => _PositionedTextViewState();
}

class _PositionedTextViewState extends State<PositionedTextView> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
