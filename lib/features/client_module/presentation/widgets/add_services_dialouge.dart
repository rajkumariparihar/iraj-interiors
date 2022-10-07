import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_sized_boxes.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_text_view.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/bloc/feature/feature_bloc.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/widgets/single_title_text.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/services_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/custome_input_field_autocompleate.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/custome_input_fields.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddServicesDialouge extends StatefulWidget {
  bool to_add_service;
  AddServicesDialouge({Key? key, required this.to_add_service})
      : super(key: key);

  @override
  _AddServicesDialougeState createState() => _AddServicesDialougeState();
}

class _AddServicesDialougeState extends State<AddServicesDialouge> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage;
  List<XFile>? imageFileList = [];
  final bloc = dcSl<FeatureBloc>();
  bool imageSelected = false, uploading = false;
  String image_url = 'Image Address here';
  String feature_selected = '';
  String service_selected = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final detailscontroller = TextEditingController();
  final dayscontroller = TextEditingController();
  List<ServicesModule> services = [];

  final List<String> _suggestions = [];

  Widget _popup_body() {
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

          if (state is ServiceUploaded) {
            Navigator.of(context).pop();
          }

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child:
                  widget.to_add_service ? formUIServices() : formUIPortfolio(),
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
      ],
    );
  }

  Widget formUIServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomeInputFields(
          header_color: Constants.primaryColor,
          controller: namecontroller,
          label: StringConstants.name,
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
        TextFormField(
          controller: detailscontroller,
          decoration: const InputDecoration(
              labelText: StringConstants.tell_something,
              labelStyle: TextStyle(color: Constants.primaryColor)),
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: 5,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return StringConstants.empty_text_msg;
            } else if (value.length < 3) {
              return StringConstants.valid_description_msg;
            }
            return null;
          },
        ),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Text(
                image_url,
                style: const TextStyle(color: Constants.primaryColor),
              ),
            ),
            (uploading)
                ? const CircularProgressIndicator()
                : MaterialButton(
                    color: Constants.primaryDarkColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    onPressed: () async {
                      setState(() {
                        uploading = true;
                      });

                      print('here');
                      await pick_image_service();
                    },
                    child: const Text(
                      StringConstants.upload,
                      style: TextStyle(color: Constants.whiteColor),
                    ),
                  )
          ],
        )
      ],
    );
  }

  pick_image_service() async {
    if (await Permission.storage.request().isGranted) {
      FirebaseStorage store = FirebaseStorage.instance;
      store.refFromURL('gs://my-cool-project-decor.appspot.com/');
      //final store = FirebaseStorage.instanceFor(
      //  bucket: "gs://my-cool-project-decor.appspot.com/");

      pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

      try {
        TaskSnapshot task = await store
            .ref('image')
            .child(pickedImage!.name)
            .putFile(File(pickedImage!.path));

        print('this is the image ${await task.ref.getDownloadURL()}');
        image_url = await task.ref.getDownloadURL();
        setState(() {
          image_url;
          uploading = !uploading;
        });
      } catch (e) {
        print('this is the exception $e');
        uploading = false;
      }

      //this is to upload and get the url
      //upload_Image(pickedImage!.path);
    } else {
      setState(() {
        uploading = false;
      });
    }
  }

  pick_images_portfolio() async {
    if (await Permission.storage.request().isGranted) {
      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
      }
      print("Image List Length:" + imageFileList!.length.toString());
      setState(() {});
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

  submit_btn() {
    return MaterialButton(
      textColor: Constants.primaryDarkColor,
      onPressed: () async {
        if (widget.to_add_service) {
          if (_formKey.currentState!.validate() &&
              image_url != 'Image Address here') {
            print('was here');
            _addServices();
          }
        } else {
          if (_formKey.currentState!.validate()) {
            if (_suggestions.contains(service_selected)) {
              _addPortfolio();
            } else {
              Fluttertoast.showToast(msg: 'Not a Valid Service Type\nSel');
            }
          }
        }
      },
      child: const Text(StringConstants.upload_caps),
    );
  }

  void _addServices() {
    bloc.add(AddServicesEvent(
        image_url: image_url,
        name: namecontroller.text,
        description: detailscontroller.text));
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetServicesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      title: SingleTitleText(
          title: StringConstants.add_services_details, fontSize: 20),
      content: _popup_body(),
      actions: [
        cancel_btn(),
        submit_btn(),
      ],
    );
  }
}
