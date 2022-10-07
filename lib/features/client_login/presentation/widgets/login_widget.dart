import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/page/singup_page.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_login_password_submit_btn.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_sized_boxes.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_text_view.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/positioned_image_view.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/positioned_text_view.dart';
import 'package:flutter_bloc_demo/features/client_module/presentation/pages/client_home_page.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  _LoginBodyWidgetState createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
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
        if (state is LoginResponsee) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: ((context) => const ClientHomePage())));
        }

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              login_title_decor(),
              //ContainerDecor(height: 20),
              CustomLoginPasswordSubmitBtn(
                emailController: emailController,
                passwordController: passwordController,
                emailHint: StringConstants.email_or_phone,
                passwordHint: StringConstants.password,
                onLoginPressed: () => loginPressed(),
              ),
              login_btn(),
            ],
          ),
        );
      }),
    );
  }

  Widget login_btn() {
    return MaterialButton(
      elevation: 10,
      height: 50,
      minWidth: MediaQuery.of(context).size.width -
          MediaQuery.of(context).size.width * .15,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      onPressed: loginPressed,
      color: Constants.primaryDarkColor,
      child: const Text(
        StringConstants.login,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget login_title_decor() {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 10,
      color: Constants.primaryDarkColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.7,
        child: Stack(
          children: <Widget>[
            PositionedImageView(
              image_url: Constants.image_light_one,
              left: 30,
              width: 80,
              height: 200,
            ),
            PositionedImageView(
              image_url: Constants.image_light_two,
              left: 140,
              width: 80,
              height: 150,
            ),
            PositionedImageView(
              image_url: Constants.image_clock,
              right: 40,
              top: 40,
              width: 80,
              height: 150,
            ),
            PositionedTextView(text: StringConstants.login)
          ],
        ),
      ),
    );
  }

  void loginPressed() async {
    // bloc.add(LoginUser(
    //     email: emailController.text, password: passwordController.text));
    // print('was here');
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const ClientHomePage())));
  }
}
