import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide(color: Colors.brown)),
              color: Colors.grey[700],
              textColor: Colors.white,
              child: Text("Add Recurring Increase"),
              onPressed: () {
                // final dao = Provider.of<DboneDao>(context);
                // final dbone = DbonesCompanion(
                //   benefit: Value(controller1.text),
                //   value: Value(controller2.numberValue),
                //   totalValue: (controller3 == "Daily")
                //       ? Value(controller2.numberValue * 365.0)
                //       : (controller3 == "Weekly")
                //           ? Value(controller2.numberValue * 52.0)
                //           : (controller3 == "Bi-Weekly")
                //               ? Value(controller2.numberValue * 26.0)
                //               : (controller3 == "Monthly")
                //                   ? Value(controller2.numberValue * 12.0)
                //                   : (controller3 == "Yearly")
                //                       ? Value(controller2.numberValue * 1.0)
                //                       : Value(controller2.numberValue * 1.0),
                //   time: (controller3 == "Daily")
                //       ? Value(365.0)
                //       : (controller3 == "Weekly")
                //           ? Value(52.0)
                //           : (controller3 == "Bi-Weekly")
                //               ? Value(26.0)
                //               : (controller3 == "Monthly")
                //                   ? Value(12.0)
                //                   : (controller3 == "Yearly")
                //                       ? Value(1.0)
                //                       : Value(1.0),
                // );
                // dao.insertDbone(dbone);
                setState(() {
                  controller1.clear();
                  controller2.clear();
                });
              },
              elevation: 8.0,
            ),
          ),
          Form(
            child: Container(
              padding: EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      controller: controller1,
                      decoration: InputDecoration(
                        hintText: 'example: Internet - Home',
                        hintStyle: TextStyle(
                          fontSize: 13.0,
                          color: Colors.red[200],
                        ),
                        labelText: 'One Recurring Increase Description',
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
                        labelText: 'Increase Amount (Value)',
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
                    padding: EdgeInsets.only(top: 3.0, left: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.brown[100],
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.brown[600],
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    height: 56,
                    width: 180,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.brown[200],
                      iconEnabledColor: Colors.blueGrey[700],
                      hint: Text("Period",
                          style: GoogleFonts.fahkwang(
                              textStyle: TextStyle(
                                  color: Colors.blueGrey[700],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600))),
                      value: controller3,
                      onChanged: (String newValue) {
                        setState(() {
                          controller3 = newValue;
                        });
                      },
                      items:
                          _period.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
