import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/bloc/feature/feature_bloc.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/service_card.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/shimmer_widget.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

import '../../../../di/dependency_injection.dart';

class FutureServices extends StatefulWidget {
  const FutureServices({Key? key}) : super(key: key);

  @override
  _FutureServicesState createState() => _FutureServicesState();
}

class _FutureServicesState extends State<FutureServices> {
  final bloc = dcSl<FeatureBloc>();
  final db = dcSl<FirebaseFirestore>();
  List<ServicesModule> services = [];

  @override
  void initState() {
    super.initState();
    bloc.add(GetServicesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: ((context, state) {
          if (state is ServicesList) {
            services = state.services;
          }

          if (services.isNotEmpty) {
            return ListView.builder(
                itemCount: services.length,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return ServiceCard(
                    titile: '${services[index].name}',
                    image_url: '${services[index].image_url}',
                    description: '${services[index].details}',
                  );
                }));
          } else {
            //return Container();
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
                    'No Services\nAvailable',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Constants.get_width(context) * 0.03,
                        color: Colors.grey),
                  )
                ],
              ),
            );
            //Code for shimmer if needed.
            // return Center(
            //   child: ListView.builder(
            //       itemCount: 10,
            //       itemBuilder: ((context, index) {
            //         return Padding(
            //           padding: EdgeInsets.all(10),
            //           child: ShimmerWidget(
            //               height: MediaQuery.of(context).size.width / 2,
            //               width: MediaQuery.of(context).size.width),
            //         );
            //       })),
            // );
          }
        }));
  }
}
