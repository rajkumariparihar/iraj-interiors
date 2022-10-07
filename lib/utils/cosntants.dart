import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static const String data = 'data';
  static const String app_name = 'Raj Interiors &\n Consultant';

  //primary colors
  static const Color primaryColor = Color(0xAA305469);
  static const Color primaryDarkColor = Color(0xAAF29320);
  static const Color hintColor = Colors.grey;
  static const Color whiteColor = Colors.white;
  static const int secondoryColorInt = 0xAA004d4d;
  static const int secondoryDarkColorInt = 0xAA006767;

  //params
  static get_width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static get_height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: '$message',
        backgroundColor: Constants.primaryColor,
        textColor: Constants.whiteColor);
  }

  //firebase cloud firestore floders
  static const String firestore_requests_folder = 'requests';
  static const String firestore_features_folder = 'features';
  static const String firestore_services_folder = 'services';
  static const String firestore_portfolio_folder = 'portfolio';

  static const String firestore_users_folder = 'users';

  //firebase keys
  static const String get_in_touch = 'get_in_touch';
  static const String firebase_key_first = 'first';
  static const String firebase_key_last = 'last';
  static const String firebase_key_email = 'email';
  static const String firebase_key_company = 'company';
  static const String firebase_key_mobile = 'mobile';
  static const String firebase_key_country = 'country';
  static const String firebase_key_details = 'details';
  static const String firebase_key_name = 'name';
  static const String firebase_key_image = 'image_url';
  static const String firebase_key_password = 'password';
  static const String firebase_key_service_name = 'service_name';
  static const String firebase_key_service_type = 'service_type';
  static const String firebase_key_service_duration = 'service_duration';
  static const String firebase_key_service_images = 'service_images';

  //images
  static const String image_light_one = 'assets/images/light-1.png';
  static const String image_light_two = 'assets/images/light-2.png';
  static const String image_clock = 'assets/images/clock.png';
  static const String app_icon = 'assets/images/app_icon.png';
}
