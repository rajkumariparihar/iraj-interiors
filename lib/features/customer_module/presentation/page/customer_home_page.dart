import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/bloc/bloc/customer_home_bloc.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/page/get_in_touch_page.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/page/login_page.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/image_slider.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int _value = 6;
  final db = dcSl<FirebaseFirestore>();
  final bloc = dcSl<CustomerHomeBloc>();
  List<ServicesModule> futureServices = [];
  List<PortfolioModule> portfolio_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // bloc.add(GetFutureServices());
    bloc.add(GetProtfolioServices());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryDarkColor,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const LoginPage()))),
          child: const Icon(CupertinoIcons.option),
        ),
        title: const Text(
          'Provider Name',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Constants.get_height(context) * 0.03,
            ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints.expand(
                  height: Constants.get_height(context) -
                      Constants.get_height(context) * 0.25),
              child: BlocBuilder(
                  bloc: bloc,
                  builder: ((context, state) {
                    if (state is FutureServicesList) {
                      futureServices = state.futureServices;
                    }

                    if (state is ProtfolioList) {
                      portfolio_list = state.portfolio_list;
                      print('got the data ${portfolio_list.length}');
                    }

                    if (portfolio_list.isNotEmpty) {
                      //var response = snapshot.data as List<ServicesModule>;
                      return ImageSlider(
                        response: portfolio_list,
                      );
                    } else {
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
                              'Services Not\nUPdated',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: Constants.get_width(context) * 0.03,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      );
                    }
                  })),
            ),
            MaterialButton(
              color: Constants.primaryDarkColor,
              height: AppBar().preferredSize.height,
              minWidth: Constants.get_width(context) -
                  Constants.get_width(context) * 0.3,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GetInTouchPage()));
              },
              child: const Text(
                "Get in Touch",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
