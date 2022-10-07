import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/singup_widget.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({Key? key}) : super(key: key);

  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Constants.primaryDarkColor),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              backgroud(),
              Container(
                padding: const EdgeInsets.only(left: 35, top: 80),
                child: const Text(
                  "Create\nAccount",
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              const SingupWidget()
            ]),
          )
        ],
      ),
    );
  }

  Widget backgroud() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Row(
            children: [
              single_card_decor(),
              single_card_decor(),
              single_card_decor()
            ],
          );
        }));
  }

  Widget single_card_decor() {
    return Card(
      color: Constants.primaryDarkColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Container(
        child: SizedBox(
          width: Constants.get_width(context) / 3.5,
          height: Constants.get_width(context) / 3.5,
        ),
      ),
    );
  }
}
