import 'package:flutter/material.dart';

import '../../../../utils/cosntants.dart';

class ContainerDecor extends StatefulWidget {
  double height;
  ContainerDecor({Key? key,required this.height}) : super(key: key);

  @override
  _ContainerDecorState createState() => _ContainerDecorState();
}

class _ContainerDecorState extends State<ContainerDecor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Constants.primaryDarkColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
