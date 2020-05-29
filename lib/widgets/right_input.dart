import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../database/tithe_db.dart';
import 'package:provider/provider.dart';

class Rinput extends StatefulWidget {
  const Rinput({
    Key key,
  }) : super(key: key);

  @override
  _RinputState createState() => _RinputState();
}

class _RinputState extends State<Rinput> {
  TextEditingController controller1 = TextEditingController();
  var controller2 = MoneyMaskedTextController(
    leftSymbol: '\$',
    decimalSeparator: '.',
    thousandSeparator: ',',
    initialValue: 0,
  );
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            labelText: 'One Time Increase Description',
                          labelStyle: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
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
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0,
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.brown)),
                      color: Colors.grey[700],
                      textColor: Colors.white,
                      child: Text(
                        "Add One Time Increase",
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
                              Provider.of<DbtwoDao>(context, listen: false);
                          final dbtwo = DbtwosCompanion(
                            benefit: Value(controller1.text),
                            value: Value(controller2.numberValue),
                          );
                          dao.insertDbtwo(dbtwo);
                          setState(() {
                            controller2.text = '0.00';
                            controller1.clear();
                          });
                        }
                      },
                      elevation: 8.0,
                    ),
                  ])),
            ],
          ),
        ));
  }
}
