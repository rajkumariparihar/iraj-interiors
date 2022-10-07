import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/floating_action_widget.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/future_services.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/request_list.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/tab_entity.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/tab_widget.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  _ClientHomePageState createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  final List<TabEntity> entity = [
    TabEntity(title: 'Services'),
    TabEntity(title: 'Requests'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        floatingActionButton: const FloatingActionWidget(),
        appBar: AppBar(
          backgroundColor: Constants.primaryDarkColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(StringConstants.client_page_title),
        ),
        body: TabWidget(
          tabColor: Constants.primaryDarkColor,
          onPageChanged: (position) {
            print(position);
          },
          entity: entity,
          children: const <Widget>[FutureServices(), RequestList()],
        ),
      ),
      onWillPop: () async {
        return true;
        // if (isDialOpen.value) {
        //   isDialOpen.value = false;
        //   return false;
        // } else {
        //   return true;
        // }
      },
    );
  }
}
