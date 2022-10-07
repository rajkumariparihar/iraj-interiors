import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/page/singup_page.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_sized_boxes.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_text_view.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custome_edit_text.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';

class CustomLoginPasswordSubmitBtn extends StatefulWidget {
  TextEditingController emailController, passwordController;
  void Function()? onLoginPressed;
  String emailHint, passwordHint;
  CustomLoginPasswordSubmitBtn(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.emailHint,
      required this.passwordHint,
      required this.onLoginPressed})
      : super(key: key);

  @override
  _CustomLoginPasswordSubmitBtnState createState() =>
      _CustomLoginPasswordSubmitBtnState();
}

class _CustomLoginPasswordSubmitBtnState
    extends State<CustomLoginPasswordSubmitBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10))
            ]),
        child: Column(
          children: <Widget>[
            CustomeEditText(
                textEditingController: widget.emailController,
                hint: widget.emailHint),
            const SizedBox(
              height: 8,
            ),
            CustomeEditText(
                textEditingController: widget.passwordController,
                hint: widget.passwordHint),
          ],
        ),
      ),
    );
  }
}
