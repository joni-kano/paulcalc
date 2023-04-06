import 'package:paulcalc/exports.dart';

class Finaldisplay extends StatelessWidget {
  Finaldisplay({super.key, required this.fprofits});

  int? fprofits;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("The balance is : "),
      content: Text(fprofits.toString()),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
