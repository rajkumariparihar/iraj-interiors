import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/bloc/feature/feature_bloc.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/pages/add_service_details_page.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'add_services_dialouge.dart';

class FloatingActionWidget extends StatefulWidget {
  const FloatingActionWidget({Key? key}) : super(key: key);

  @override
  _FloatingActionWidgetState createState() => _FloatingActionWidgetState();
}

class _FloatingActionWidgetState extends State<FloatingActionWidget> {
  final bloc = dcSl<FeatureBloc>();

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      openCloseDial: isDialOpen,
      backgroundColor: Constants.primaryDarkColor,
      overlayColor: Colors.grey,
      overlayOpacity: 0.5,
      spacing: 15,
      spaceBetweenChildren: 15,
      closeManually: true,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.star_rounded),
            label: StringConstants.add_portfolio,
            backgroundColor: Constants.primaryColor,
            onTap: () {
              print('portFolio added');
              // showDialog(
              //     context: context,
              //     builder: ((context) => AddServicesDialouge(
              //           to_add_service: false,
              //         )));
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => AddServiceDetailsPage()),
                ),
              );
              isDialOpen.value = !isDialOpen.value;
            }),
        SpeedDialChild(
            child: const Icon(Icons.handshake_rounded),
            label: StringConstants.add_services,
            backgroundColor: Constants.primaryColor,
            onTap: () {
              //final ImagePicker _picker = ImagePicker();
              showDialog(
                  context: context,
                  builder: ((context) => AddServicesDialouge(
                        to_add_service: true,
                      )));

              print('service added');
              isDialOpen.value = !isDialOpen.value;
            }),
      ],
    );
  }
}
