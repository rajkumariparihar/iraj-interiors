import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_sized_boxes.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_text_view.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/bloc/feature/feature_bloc.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/custome_input_field_autocompleate.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/custome_input_fields.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/image_shimmer.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddServiceDetailsPage extends StatefulWidget {
  const AddServiceDetailsPage({Key? key}) : super(key: key);

  @override
  _AddServiceDetailsPageState createState() => _AddServiceDetailsPageState();
}

class _AddServiceDetailsPageState extends State<AddServiceDetailsPage> {
  final ImagePicker imagePicker = ImagePicker();
  final bloc = dcSl<FeatureBloc>();

  String service_selected = '';
  final List<String> _suggestions = [];
  List<XFile>? imageFileList = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String image_url = 'Image Address here';
  bool imageSelected = false, uploading = false;

  final detailscontroller = TextEditingController();
  final dayscontroller = TextEditingController();
  final namecontroller = TextEditingController();
  List<ServicesModule> services = [];
  bool submit_pressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetServicesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryDarkColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder(
        bloc: bloc,
        builder: ((context, state) {
          if (state is ServicesList) {
            services = state.services;
            for (ServicesModule service in services) {
              print('in here for ${service.name}');
              _suggestions.add('${service.name}');
            }
          }
          if (state is PorfolioUploaded) {
            Navigator.of(context).pop();
          }

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: formUIPortfolio(),
            ),
          );
        }));
  }

  Widget formUIPortfolio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextView(
          text: 'Service Type',
        ),
        CustomeInputFieldAutocompleate(
          label: 'label',
          onSelected: (value) {
            setState(() {
              service_selected = value;
            });
          },
          suggestions: _suggestions,
        ),
        CustomeInputFields(
          controller: namecontroller,
          label: StringConstants.service_name,
          textInputType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return StringConstants.empty_text_msg;
            } else if (value.length < 3) {
              return StringConstants.valid_name_msg;
            }
            return null;
          },
        ),
        CustomeInputFields(
          controller: dayscontroller,
          label: StringConstants.service_duration,
          textInputType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return StringConstants.empty_text_msg;
            } else if (value.length <= 0) {
              return StringConstants.valid_duration_msg;
            }
            return null;
          },
        ),
        CustomSizedBoxes(
          height: 20,
        ),
        CustomTextView(
          text:
              '${StringConstants.selected_images}${imageFileList!.length != null ? imageFileList!.length : 0}',
        ),
        (imageFileList!.length != null)
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: imageFileList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                itemBuilder: ((context, index) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.network(
                        "${imageFileList![index]}",
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.photo_fill,
                                color: Color(Constants.secondoryDarkColorInt),
                              ),
                              CustomTextView(
                                text: 'Image Loading\nFailed',
                                textAlign: TextAlign.center,
                              )
                            ],
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: ImageShimmer());
                        },
                      ),
                    ),
                  );
                }))
            : Container(
                child: Text('selectImage'),
              ),
        MaterialButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Constants.primaryDarkColor,
          textColor: Constants.primaryDarkColor,
          onPressed: () async {
            pick_images_portfolio();
            setState(() {});
          },
          child: const Text(
            StringConstants.pickImages,
            style: TextStyle(color: Constants.whiteColor),
          ),
        ),
        CustomSizedBoxes(
          height: 20,
        ),
        submit_btn(loading: submit_pressed)
      ],
    );
  }

  pick_images_portfolio() async {
    if (await Permission.storage.request().isGranted) {
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
      }
      print("Image List Length:${imageFileList!.length}");
      setState(() {});
    }
  }

  submit_btn({required bool loading}) {
    return MaterialButton(
      color: Constants.primaryDarkColor,
      textColor: Constants.whiteColor,
      onPressed: () async {
        setState(() {
          submit_pressed = true;
        });
        if (_formKey.currentState!.validate()) {
          if (_suggestions.contains(service_selected)) {
            _addPortfolio();
          } else {
            Fluttertoast.showToast(msg: 'Not a Valid Service Type\nSel');
          }
        }
      },
      child: (loading)
          ? const CircularProgressIndicator()
          : const Text(StringConstants.upload_caps),
    );
  }

  void _addPortfolio() async {
    if (imageFileList != null && imageFileList!.isNotEmpty) {
      print('Add Protfolio');
      FirebaseStorage store = FirebaseStorage.instance;
      store.refFromURL('gs://my-cool-project-decor.appspot.com/');
      List<String> uploadedImages = [];

      for (XFile selectedImage in imageFileList!) {
        try {
          TaskSnapshot task = await store
              .ref('image')
              .child(selectedImage.name)
              .putFile(File(selectedImage.path));

          print('this is the image ${await task.ref.getDownloadURL()}');
          image_url = await task.ref.getDownloadURL();

          uploadedImages.add(image_url);
          setState(() {
            image_url;
            uploading = !uploading;
          });
        } catch (e) {
          print('this is the exception $e');
          uploading = false;
        }
      }

      bloc.add(AddProfolio(
        serviceType: service_selected,
        serviceName: namecontroller.text,
        serviceDuration: dayscontroller.text,
        images: uploadedImages,
      ));
    } else {
      Fluttertoast.showToast(msg: 'Select Images To Continue');
    }
  }

  cancel_btn() {
    return MaterialButton(
      textColor: Constants.primaryDarkColor,
      onPressed: () async {
        Navigator.of(context).pop();
      },
      child: const Text('CANCEL'),
    );
  }
}
