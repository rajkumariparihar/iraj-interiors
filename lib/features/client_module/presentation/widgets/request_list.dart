import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../utils/cosntants.dart';
import '../../../client_module/data/datamodels/request_module.dart';
import '../bloc/feature/feature_bloc.dart';
import 'request_card.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  final db = dcSl<FirebaseFirestore>();
  final bloc = dcSl<FeatureBloc>();
  List<RequestModule> requests = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetRequestsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: ((context, state) {
          if (state is RequestsList) {
            requests = state.requests;
          }

          if (requests.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.wifi_slash,
                    color: Colors.grey,
                    size: Constants.get_width(context) / 4,
                  ),
                  Text(
                    'No Requests',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Constants.get_width(context) * 0.03,
                        color: Colors.grey),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
              itemCount: requests.length,
              itemBuilder: ((context, index) {
                return RequestCard(index: index, details: requests[index]);
              }));
        }));
  }

  Future<List<RequestModule>> getRequests() async {
    List<RequestModule> requests = [];
    await db
        .collection(Constants.firestore_requests_folder)
        .get()
        .then((event) {
      print('here ${event.docs}');
      for (var doc in event.docs) {
        print("${doc.id} => ");
        var data = doc.data();

        requests.add(RequestModule(
            id: doc.id,
            first: data[Constants.firebase_key_first],
            last: data[Constants.firebase_key_last],
            address: data[Constants.firebase_key_country],
            details: data[Constants.firebase_key_details],
            company: data[Constants.firebase_key_company],
            email: data[Constants.firebase_key_email],
            mobile: data[Constants.firebase_key_mobile]));
      }
    });

    return requests;
  }
}
