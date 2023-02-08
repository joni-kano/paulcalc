// ignore_for_file: file_names, unused_local_variable

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

  final TextEditingController depositresidentamount = TextEditingController();

  final TextEditingController balanceamount = TextEditingController();

  void commissiondisposer() {
    // Clean up the controller when the widget is disposed.
    commisionamount.dispose();
    super.dispose();
  }

  void residentpermitamountdisposer() {
    residentpermitamount.dispose();
    super.dispose();
  }

  void visafeeamountdisposer() {
    visafeeamount.dispose();
    super.dispose();
  }

  void datedisposer() {
    date.dispose();
    super.dispose();
  }

  void fullnamedisposer() {
    fullname.dispose();
    super.dispose();
  }

  void referalamountdisposer() {
    referalamount.dispose();
    super.dispose();
  }

  void depositresidentamountdisposer() {
    depositresidentamount.dispose();
    super.dispose();
  }

  void balanceamountdisposer() {
    balanceamount.dispose();
    super.dispose();
  }
  void profit() {
    
    int commisionpaid = int.parse(commisionamount as String);
    int residentpermit = int.parse(residentpermitamount as String);
    int visafee = int.parse(visafeeamount as String);
    int profits = commisionpaid + (residentpermit - visafee);

    print("$profits");
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
                  hint: "Deposit Resident ",
                  controllername: depositresidentamount,
                  inputType: TextInputType.number),
              TxtField(
                  hint: "Balance",
                  controllername: balanceamount,
                  inputType: TextInputType.number),
              const SizedBox(height: 16),
              const TxtButton(bname: "Calculate"),
              const Text(""),
              const SizedBox(
                height: 16 / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
