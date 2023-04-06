import 'package:flutter/material.dart';

class TxtButton extends StatelessWidget {
  TxtButton({
    Key? key,
    required this.bname,
    required this.onpressed,
  }) : super(key: key);
  final String bname;
  Function() onpressed;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          bname,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
