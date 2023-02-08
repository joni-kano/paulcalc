import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulcalc/widgets/dialog.dart';

class TxtButton extends StatelessWidget {
  const TxtButton({
    Key? key,
    required this.bname,
  }) : super(key: key);
  final String bname;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      child: TextButton(
        child: Text(
          bname,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        onPressed: () {
          if (bname == "Calculate") {
            
            Get.to( const Finaldisplay());
          }
        },
      ),
    );
  }
}
