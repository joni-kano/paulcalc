// ignore_for_file: file_names, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  TxtField({
    Key? key,
    required this.hint,
    required this.inputType,
    required this.controllername, 
  }) : super(key: key);
  final String hint;
  final inputType;
  var controllername;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white24,
      ),
      child: TextField(
        keyboardType: inputType,
        controller: controllername,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
