import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datasource/customer_data_source.dart';

import '../../../../utils/cosntants.dart';

class CustomerDataSourceImpl extends CustomerDataSource {
  //var db = FirebaseFirestore.instance;

  final db = dcSl<FirebaseFirestore>();

  @override
  Future<String> submitTouchRequest(
      {required String name,
      required String last_name,
      required String email,
      required String company_name,
      required String mobile,
      required String country,
      required String description}) async {
    // TODO: implement submitTouchRequest

    final user = <String, dynamic>{
      Constants.firebase_key_first: name,
      Constants.firebase_key_last: last_name,
      Constants.firebase_key_email: email,
      Constants.firebase_key_company: company_name,
      Constants.firebase_key_mobile: mobile,
      Constants.firebase_key_country: country,
      Constants.firebase_key_details: description
    };

    DocumentReference refrece =
        await db.collection(Constants.firestore_requests_folder).add(user);

    return refrece.id;
  }

  @override
  Future<List<ServicesModule>> getFutureServices() async {
    List<ServicesModule> services = [];
    await db
        .collection(Constants.firestore_services_folder)
        .get()
        .then((event) {
      print('here ${event.docs}');
      for (var doc in event.docs) {
        print("${doc.id} => ");
        var data = doc.data();

        services.add(ServicesModule(
            id: doc.id,
            name: data[Constants.firebase_key_name],
            details: data[Constants.firebase_key_details],
            image_url: data[Constants.firebase_key_image]));
      }
    });

    return services;
  }

  @override
  Future<List<PortfolioModule>> getProtfolio() async {
    print('here for data');
    List<PortfolioModule> portfolio = [];
    await db
        .collection(Constants.firestore_portfolio_folder)
        .get()
        .then((event) {
      print('here ${event.docs}');
      for (var doc in event.docs) {
        print("${doc.id} => ");
        var data = doc.data();

        portfolio.add(PortfolioModule(
          id: doc.id,
          serviceType: data[Constants.firebase_key_service_type],
          serviceName: data[Constants.firebase_key_service_name],
          serviceDuration: data[Constants.firebase_key_service_duration],
          serviceImages: List.from(data[Constants.firebase_key_service_images]),
        ));
      }
    });
    print('got the data ${portfolio.length}');

    return portfolio;
  }
}
