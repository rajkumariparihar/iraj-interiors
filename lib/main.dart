import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/splash_screen.dart';
import 'package:flutter_bloc_demo/utils/dio_api_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

setUpAll() async {
  DioApiClient _dioApiClient = DioApiClient();
  await initServiceLocator(_dioApiClient);
}

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await setUpAll();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///Setting up crash logger for logging fatal errors in application to log them in Sentry/Firebase analytics
  runZonedGuarded(() async {
    runApp(const MyApp());
  }, (object, trace) async {
    print(trace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
