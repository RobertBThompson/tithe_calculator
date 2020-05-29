import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:tithing_calculator/widgets/display_slider.dart';
import '../database/tithe_db.dart';
import 'package:provider/provider.dart';

class Tub extends StatefulWidget {
  const Tub({
    Key key,
  }) : super(key: key);

  @override
  _TubState createState() => _TubState();
}

class _TubState extends State<Tub> {
  var controller1 = MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return _buildTub(context);
  }

  StreamBuilder _buildTub(BuildContext context) {
    final daoP = Provider.of<DbtwoDao>(context);
    return StreamBuilder(
      stream: daoP.sumerValues(),
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          final simple = snapshot.data;
          double _tithe =
              Provider.of<Bubby>(context, listen: true).currentValue.toDouble() /
                  100;
          final daily = simple * _tithe;
          controller1 = MoneyMaskedTextController(
            initialValue: daily,
            leftSymbol: '\$',
            decimalSeparator: '.',
            thousandSeparator: ',',
            precision: 2,
          );
          return Container(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                Text(
                  "PAY ONCE",
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
          );
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
