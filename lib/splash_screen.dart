import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/page/customer_home_page.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash_delay();
  }

  splash_delay() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const CustomerHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryDarkColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            app_logo(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '${Constants.app_name}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Constants.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget app_logo() {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(150),
              bottomLeft: Radius.circular(150),
              topLeft: Radius.circular(150),
              bottomRight: Radius.circular(150))),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                  bottomLeft: Radius.circular(150),
                  topLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150))),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(150)),
              child: Image.asset(
                Constants.app_icon,
                height: 80,
                width: 80,
              ),),

          ),
        ),
      ),
    );
  }
}
