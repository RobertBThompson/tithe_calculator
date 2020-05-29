import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../database/tithe_db.dart';
import 'package:provider/provider.dart';

class Linput extends StatefulWidget {
  const Linput({
    Key key,
  }) : super(key: key);

  @override
  _LinputState createState() => _LinputState();
}

class _LinputState extends State<Linput> {
  var controller2 = MoneyMaskedTextController(
    leftSymbol: '\$',
    decimalSeparator: '.',
    thousandSeparator: ',',
    initialValue: 0,
  );
  TextEditingController controller1 = TextEditingController();
  String controller3;
  List<String> _period = ["Daily", "Weekly", "Bi-Weekly", "Monthly", "Yearly"];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(3.0),
                      height: 80,
                      width: 300,
                      child: TextFormField(
                        controller: controller1,
                        maxLength: 22,
                        validator: (value) {
                          return value.isEmpty ? "Description Required" : null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Recurring Increase Description',
                          labelStyle: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(3.0),
                      height: 70,
                      width: 300,
                      child: TextFormField(
                        controller: controller2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Increase Amount (Recurring Value)',
                          labelStyle: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 1.0, left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.brown[200],
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      height: 48,
                      width: 180,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.brown[50],
                          iconEnabledColor: Colors.blueGrey[700],
                          hint: Text("Monthly",
                              style: GoogleFonts.sortsMillGoudy(
                                  textStyle: TextStyle(
                                      color: Colors.blueGrey[800],
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500))),
                          value: controller3,
                          onChanged: (String newValue) {
                            setState(() {
                              
                              controller3 = newValue;
                            });
                          },
                          items: _period
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: GoogleFonts.sortsMillGoudy(
                                      textStyle: TextStyle(
                                          color: Colors.blueGrey[800],
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500))),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50.0,
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: BorderSide(color: Colors.brown)),
                        color: Colors.grey[600],
                        textColor: Colors.white,
                        child: Text(
                          "Add Recurring Increase",
                          style: GoogleFonts.sortsMillGoudy(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            final dao =
                                Provider.of<DboneDao>(context, listen: false);
                            final dbone = DbonesCompanion(
                              benefit: Value(controller1.text),
                              value: Value(controller2.numberValue),
                              totalValue: (controller3 == "Daily")
                                  ? Value(controller2.numberValue * 365.0)
                                  : (controller3 == "Weekly")
                                      ? Value(controller2.numberValue * 52.0)
                                      : (controller3 == "Bi-Weekly")
                                          ? Value(
                                              controller2.numberValue * 26.0)
                                          : (controller3 == "Monthly")
                                              ? Value(controller2.numberValue *
                                                  12.0)
                                              : (controller3 == "Yearly")
                                                  ? Value(
                                                      controller2.numberValue *
                                                          1.0)
                                                  : Value(
                                                      controller2.numberValue *
                                                          12.0),
                              time: (controller3 == "Daily")
                                  ? Value(365.0)
                                  : (controller3 == "Weekly")
                                      ? Value(52.0)
                                      : (controller3 == "Bi-Weekly")
                                          ? Value(26.0)
                                          : (controller3 == "Monthly")
                                              ? Value(12.0)
                                              : (controller3 == "Yearly")
                                                  ? Value(1.0)
                                                  : Value(12.0),
                            );
                            dao.insertDbone(dbone);
                            setState(() {
                              controller2.text = '0.00';
                              controller1.clear();
                            });
                          }
                        },
                        elevation: 8.0,
                      ),
                    ],
                  )),
            ])));
  }
}
