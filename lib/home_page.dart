import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_toggle_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController billController = TextEditingController();
List<bool> _selected = [true, false, false, false];
final _formKey = GlobalKey<FormState>();

double totalBillAmount = 0.0;
double tipAmount = 0.0;

class _HomePageState extends State<HomePage> {
  void calculate() {
    final billAmount = double.parse(billController.text.trim());
    final tipIndex = _selected.indexWhere((element) => element);
    final tipPercent = [0.1, 0.11, 0.12, 0.13][tipIndex];

    setState(() {
      tipAmount = double.parse((billAmount * tipPercent).toStringAsFixed(2));
      totalBillAmount =
          double.parse((billAmount + tipAmount).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8FFFD),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 13, 160, 89),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Bill-e',
            style: GoogleFonts.lobster(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter bill amount',
                  style: GoogleFonts.roboto(
                      color: Color(0xFF9EA1A1), fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                        controller: billController,
                        style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: '\$',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'please enter valid amount';
                          }
                          return null;
                        }),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Enter Tip',
                  style: GoogleFonts.roboto(
                      fontSize: 25, color: Color(0xFF9EA1A1)),
                ),
                SizedBox(
                  height: 20,
                ),
                MyToggleBtn(selected: _selected),
                SizedBox(height: 50),
                Container(
                  height: 70,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 13, 160, 89)),
                    child: Text(
                      'Calculate',
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculate();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Total Bill Amount',
                  style: GoogleFonts.roboto(
                      fontSize: 30, color: Color(0xFF9EA1A1)),
                ),
                Text(
                  '\$$totalBillAmount',
                  style: GoogleFonts.roboto(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 13, 160, 89)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tip Amount',
                  style: GoogleFonts.roboto(
                      fontSize: 20, color: Color(0xFF9EA1A1)),
                ),
                Text(
                  '\$$tipAmount',
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 13, 160, 89)),
                ),
              ],
            ),
          ),
        )));
  }
}
