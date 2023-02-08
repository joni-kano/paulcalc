import 'package:paulcalc/exports.dart';

class Finaldisplay extends StatelessWidget {
  const Finaldisplay({super.key});

  get profits => null;

  Widget resultProfits(CalcScreen profits) {
    return profits;
  }
  
  @override
  
  Widget build(BuildContext context) {
    
    return AlertDialog(
      title: const Text("The balance is : "),
      content: Text(profits.toString()),
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
