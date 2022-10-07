import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_sized_boxes.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/bloc/get_in_touch/get_in_touch_bloc.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/custome_input_fields.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';

import '../../../../di/dependency_injection.dart';

class GetInTouchPage extends StatefulWidget {
  const GetInTouchPage({Key? key}) : super(key: key);

  @override
  _GetInTouchPageState createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  final bloc = dcSl<GetInTouchBloc>();

  void _submitTouchRequest() {
    bloc.add(SubmitPresssed(
        name: namecontroller.text,
        last_name: lastnamecontroller.text,
        email: emailcontroller.text,
        company_name: companynamecontroller.text,
        mobile: mobilecontroller.text,
        country: countrycontroller.text,
        description: detailscontroller.text));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final companynamecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final detailscontroller = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryDarkColor,
        elevation: 10,
      ),
      body: BlocListener<GetInTouchBloc, GetInTouchState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is GetInTouchSubmitted) {
            print(state.message);
            Navigator.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [FormUI(), hangout_symbol()],
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                    topLeft: Radius.circular(150),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(150))),
            color: Constants.primaryColor,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 70, right: 70, top: 50, bottom: 50),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Text(
                      'Get In Touch',
                      style:
                          TextStyle(fontSize: 20, color: Constants.whiteColor),
                    ),
                  ),
                  CustomeInputFields(
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
                  CustomeInputFields(
                    controller: lastnamecontroller,
                    label: StringConstants.last_name,
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.empty_text_msg;
                      } else if (value.length < 3) {
                        return StringConstants.valid_last_name_msg;
                      }
                      return null;
                    },
                  ),
                  CustomeInputFields(
                    controller: emailcontroller,
                    label: StringConstants.email,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      final regexp = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                      if (value == null || value.isEmpty) {
                        return StringConstants.empty_text_msg;
                      } else if (!regexp.hasMatch(value)) {
                        return StringConstants.valid_email_msg;
                      }
                      return null;
                    },
                  ),
                  CustomeInputFields(
                    controller: companynamecontroller,
                    label: StringConstants.company_name,
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.empty_text_msg;
                      } else if (value.length < 3) {
                        return StringConstants.valid_company_msg;
                      }

                      return null;
                    },
                  ),
                  CustomeInputFields(
                      controller: mobilecontroller,
                      label: StringConstants.mobile,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        final regexp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

                        if (value == null || value.isEmpty) {
                          return StringConstants.empty_text_msg;
                        } else if (!regexp.hasMatch(value)) {
                          return StringConstants.valid_mobile_msg;
                        }
                        return null;
                      }),
                  CustomeInputFields(
                    controller: countrycontroller,
                    label: StringConstants.country,
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.empty_text_msg;
                      } else if (value.length < 3) {
                        return StringConstants.valid_country_msg;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: detailscontroller,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Constants.whiteColor),
                        labelText: StringConstants.tell_something),
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(fontSize: 12),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    color: Constants.primaryDarkColor,
                    minWidth: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.3,
                    height: AppBar().preferredSize.height -
                        AppBar().preferredSize.height / 4,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitTouchRequest();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(StringConstants.processing_data)),
                        );
                      }
                    }, //_validateInputs,
                    child: const Text(
                      StringConstants.submit,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CustomSizedBoxes(
                    height: 5,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget hangout_symbol() {
    return Positioned(
        child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 50),
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
      ),
    ));
  }
}
