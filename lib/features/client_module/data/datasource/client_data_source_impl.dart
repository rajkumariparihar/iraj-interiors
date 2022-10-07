import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datamodels/request_module.dart';
import 'package:flutter_bloc_demo/features/client_module/data/datasource/client_data_source.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../utils/cosntants.dart';

class ClientDataSourceImpl extends ClientDataSource {
  final db = dcSl<FirebaseFirestore>();

  @override
  Future<String> uploadFeature(
      {required String name,
      required String details,
      required String image_url}) async {
    final feature = <String, dynamic>{
      Constants.firebase_key_name: name,
      Constants.firebase_key_details: details,
      Constants.firebase_key_image: image_url
    };

    DocumentReference refrece =
        await db.collection(Constants.firestore_features_folder).add(feature);

    return refrece.id;
  }

  @override
  Future<String> uploadService(
      {required String name,
      required String details,
      required String image_url}) async {
    final service = <String, dynamic>{
      Constants.firebase_key_name: name,
      Constants.firebase_key_details: details,
      Constants.firebase_key_image: image_url
    };

    DocumentReference refrece =
        await db.collection(Constants.firestore_services_folder).add(service);
    return refrece.id;
  }

  @override
  Future<List<RequestModule>> getRequests() async {
    // TODO: implement getRequests

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

  @override
  Future<List<ServicesModule>> getServices() async {
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
  Future<String> uploadPortfolio({
    required String serviceType,
    required String serviceName,
    required String duration,
    required List<String> images,
  }) async {
    print('Reached till upload feature');
    // TODO: implement uploadPortfolio

    final portfolio = <String, dynamic>{
      Constants.firebase_key_service_name: serviceName,
      Constants.firebase_key_service_type: serviceType,
      Constants.firebase_key_service_duration: duration,
      Constants.firebase_key_service_images: images
    };

    DocumentReference refrece = await db
        .collection(Constants.firestore_portfolio_folder)
        .add(portfolio);
    return refrece.id;
  }
}
