import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class CustomeInputFieldAutocompleate extends StatefulWidget {
  TextInputType? textInputType = TextInputType.text;
  String label;
  final namecontroller = TextEditingController();

  FormFieldValidator<String>? validator;
  List<String> suggestions;
  void Function(String)? onSelected;

  CustomeInputFieldAutocompleate(
      {Key? key,
      required this.label,
      required this.onSelected,
      this.textInputType,
      required this.suggestions,
      this.validator})
      : super(key: key);

  @override
  _CustomeInputFieldAutocompleateState createState() =>
      _CustomeInputFieldAutocompleateState();
}

class _CustomeInputFieldAutocompleateState
    extends State<CustomeInputFieldAutocompleate> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
        optionsBuilder: (TextEditingValue value) {
          if (value.text.isEmpty) {
            return [];
          }
          return widget.suggestions.where((suggestion) =>
              suggestion.toLowerCase().contains(value.text.toLowerCase()));
        },
        onSelected: widget.onSelected);
  }
}
