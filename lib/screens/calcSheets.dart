// ignore_for_file: file_names, unused_local_variable

import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paulcalc/exports.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final TextEditingController commisionamount = TextEditingController();

  final TextEditingController residentpermitamount = TextEditingController();

  final TextEditingController visafeeamount = TextEditingController();

  final TextEditingController fullname = TextEditingController();

  final TextEditingController date = TextEditingController();

  final TextEditingController referalamount = TextEditingController();

  final TextEditingController flightamount = TextEditingController();

  final TextEditingController balanceamount = TextEditingController();

  int? profits = 0,
      commisionpaid = 0,
      residentpermit = 0,
      visafee = 0,
      flight = 0,
      refferalpay = 0;

  void _profit() {
    setState(() {
      commisionpaid = int.parse(commisionamount.text);
      residentpermit = int.parse(residentpermitamount.text);
      visafee = int.parse(visafeeamount.text);
      refferalpay = int.parse(referalamount.text);
      flight = int.parse(flightamount.text);

      profits = commisionpaid! -
          (residentpermit! + visafee! + refferalpay! + flight!);

      print("it is done");
    });
  }

  void exportToExcel() async {
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String filePath = '${documentsDirectory.path}/example.xlsx';
    print("this is the path:${filePath}");
    //headers
    sheet.appendRow([
      "Fullname",
      "Date"
      "Commision Paid ",
      "Refferal Pay",
      "Resident Pay",
      "Visa",
      "Flight"
      "Balance"
      "Total"
    ]);
    //add data
    sheet.appendRow([
      fullname.text,
      date.text,
      commisionamount.text,
      referalamount.text,
      residentpermitamount.text,
      visafeeamount.text,
      flightamount.text,
      balanceamount.text,
      profits.toString(),
    ]);
    //save file
    await excel.save(fileName: filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
            child: Text(
          "Calculations",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Enter the fields data",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TxtField(
                  hint: "Full Name ",
                  controllername: fullname,
                  inputType: TextInputType.name),
              TxtField(
                hint: "Date",
                controllername: date,
                inputType: TextInputType.datetime,
              ),
              TxtField(
                  hint: "Commission paid",
                  controllername: commisionamount,
                  inputType: TextInputType.number),
              TxtField(
                hint: "Refferal Pay",
                inputType: TextInputType.number,
                controllername: referalamount,
              ),
              TxtField(
                hint: "Resident Permit",
                controllername: residentpermitamount,
                inputType: TextInputType.number,
              ),
              TxtField(
                  hint: "Visa fee",
                  controllername: visafeeamount,
                  inputType: TextInputType.number),
              TxtField(
                  hint: "Flight",
                  controllername: flightamount,
                  inputType: TextInputType.number),
              TxtField(
                  hint: "Balance",
                  controllername: balanceamount,
                  inputType: TextInputType.number),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: TextButton(
                  onPressed: _profit,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 16 / 2,
              ),
              Text(
                "Total:$profits",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green),
                child: TextButton(
                  onPressed: exportToExcel,
                  child: const Text(
                    "Export Excel",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void allFieldsDisposer() {
    commisionamount.dispose();
    residentpermitamount.dispose();
    visafeeamount.dispose();
    date.dispose();
    fullname.dispose();
    referalamount.dispose();
    flightamount.dispose();
    balanceamount.dispose();
    super.dispose();
  }
}
