import 'package:flutter/material.dart';

import 'single_title_text.dart';

class CardDescriptions extends StatefulWidget {
  String name, email, phone, address, description;

  CardDescriptions(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.description})
      : super(key: key);

  @override
  _CardDescriptionsState createState() => _CardDescriptionsState();
}

class _CardDescriptionsState extends State<CardDescriptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleTitleText(title: '${widget.name}', fontSize: 20),
        SingleTitleText(title: '${widget.email}', fontSize: 15),
        SingleTitleText(title: '${widget.phone}', fontSize: 15),
      ],
    );
  }
}
