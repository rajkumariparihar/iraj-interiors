import 'package:flutter/material.dart';

import '../../../client_module/data/datamodels/request_module.dart';
import 'card_descriptions.dart';
import 'show_details_dialouge.dart';

class RequestCard extends StatefulWidget {
  int index;
  RequestModule details;

  RequestCard({Key? key, required this.index, required this.details})
      : super(key: key);

  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: ((context) => ShowDetailsDialouge(
                  index: widget.index,
                  data: widget.details,
                ))),
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: CardDescriptions(
                          name: '${widget.details.first}',
                          email: '${widget.details.email}',
                          phone: '${widget.details.mobile}',
                          address: '${widget.details.address}',
                          description: '${widget.details.details}'),
                    ),
                    IconButton(
                        onPressed: () {
                          print('clicked ${widget.index}');
                          showDialog(
                              context: context,
                              builder: ((context) => ShowDetailsDialouge(
                                    index: widget.index,
                                    data: widget.details,
                                  )));
                        },
                        icon: const Icon(Icons.navigate_next))
                  ],
                ))),
      ),
    );
  }
}
