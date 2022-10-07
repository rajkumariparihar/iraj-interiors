import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/singup_obsecure_text_filed.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/singup_text_field.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingupWidget extends StatefulWidget {
  const SingupWidget({Key? key}) : super(key: key);

  @override
  _SingupWidgetState createState() => _SingupWidgetState();
}

class _SingupWidgetState extends State<SingupWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bloc = dcSl<LoginBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: ((context, state) {
          if (state is RegisterResponse) {
            Navigator.of(context).pop();
            Fluttertoast.showToast(
                msg: "User Updated",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Constants.primaryDarkColor,
                textColor: Colors.white,
                fontSize: 16.0);
          }

          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
              child: Column(children: [
                SingupTextField(
                  titile: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                SingupTextField(
                  titile: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                SingupObsecureTextFiled(
                  titile: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                nameController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              // bloc.add(OnRegisterEvent(
                              //     name: nameController.text,
                              //     email: emailController.text,
                              //     password: passwordController.text));
                            } else {
                              print('values not compleate');
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          );
        }));
  }
}
