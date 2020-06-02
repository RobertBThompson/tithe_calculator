import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:tithe_calculator/widgets/display_slider.dart';
import '../database/tithe_db.dart';
import 'package:provider/provider.dart';
import '../home.dart';

class Sub extends StatefulWidget {
  const Sub({
    Key key,
  }) : super(key: key);

  @override
  _SubState createState() => _SubState();
}

class _SubState extends State<Sub> {
  var controller1 = MoneyMaskedTextController();
  var controller2 = MoneyMaskedTextController();
  var controller3 = MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, Rubby rubby, child) => child,
      child: _buildSub(context),
    );
  }

  StreamBuilder _buildSub(BuildContext context) {
    final daoP = Provider.of<DboneDao>(context, listen: true);
    return StreamBuilder(
      stream: daoP.sumValues(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final simple = snapshot.data;
          double _tithe = Provider.of<Bubby>(context, listen: true)
                  .currentValue
                  .toDouble() /
              100;
          final daily = simple * _tithe / 365.0;
          final monthly = simple * _tithe / 12.0;
          final yearly = simple * _tithe;
          controller1 = MoneyMaskedTextController(
            initialValue: daily,
            leftSymbol: '\$',
            decimalSeparator: '.',
            thousandSeparator: ',',
            precision: 2,
          );
          controller2 = MoneyMaskedTextController(
            initialValue: monthly,
            leftSymbol: '\$',
            decimalSeparator: '.',
            thousandSeparator: ',',
            precision: 2,
          );
          controller3 = MoneyMaskedTextController(
            initialValue: yearly,
            leftSymbol: '\$',
            decimalSeparator: '.',
            thousandSeparator: ',',
            precision: 2,
          );
          return Container(
            padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => {},
                  elevation: 12.0,
                  color: Colors.brown[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "DAILY",
                          style: GoogleFonts.sortsMillGoudy(
                            textStyle: TextStyle(
                              color: Color(0xFF630f02),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          controller1.text,
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => {},
                  elevation: 12.0,
                  color: Colors.brown[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "MONTHLY",
                          style: GoogleFonts.sortsMillGoudy(
                            textStyle: TextStyle(
                              color: Color(0xFF630f02),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          controller2.text,
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => {},
                  elevation: 12.0,
                  color: Colors.brown[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "YEARLY",
                          style: GoogleFonts.sortsMillGoudy(
                            textStyle: TextStyle(
                              color: Color(0xFF630f02),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          controller3.text,
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
