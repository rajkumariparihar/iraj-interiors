import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../utils/cosntants.dart';
import '../../../client_module/data/datamodels/request_module.dart';
import 'single_title_text.dart';

class ShowDetailsDialouge extends StatefulWidget {
  int index;
  RequestModule data;

  ShowDetailsDialouge({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  _ShowDetailsDialougeState createState() => _ShowDetailsDialougeState();
}

class _ShowDetailsDialougeState extends State<ShowDetailsDialouge> {
  final db = dcSl<FirebaseFirestore>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      title: SingleTitleText(title: 'Request Details', fontSize: 20),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleTitleText(
              title: '${widget.data.first} ${widget.data.last}', fontSize: 20),
          SingleTitleText(
            title: '${widget.data.email}',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          SingleTitleText(
              title: '+${widget.data.mobile}',
              fontSize: 15,
              fontWeight: FontWeight.w500),
          SingleTitleText(
              title: '${widget.data.address}',
              fontSize: 15,
              fontWeight: FontWeight.w500),
          SingleTitleText(
              title: '${widget.data.details}',
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ],
      ),
      actions: [
        MaterialButton(
          textColor: Constants.primaryDarkColor,
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {});
          },
          child: const Text('DISMISS'),
        ),
        MaterialButton(
          textColor: Constants.primaryDarkColor,
          onPressed: () async {
            await cancelRequest("${widget.data.id}");
            Navigator.of(context).pop();
            setState(() {});
          },
          child: const Text('REJECT'),
        ),
        MaterialButton(
          textColor: Constants.primaryDarkColor,
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {});
          },
          child: const Text('CALL  📞'),
        ),
      ],
    );
  }

  Future<void> cancelRequest(String id) async {
    await db.collection(Constants.firestore_requests_folder).doc(id).delete();
    print('Sucessflull');
  }
}
