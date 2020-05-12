import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Bub extends StatefulWidget {
  @override
  _BubState createState() => _BubState();
}

class _BubState extends State<Bub> {
  var diezmo = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Slider(
              value: diezmo,
              min: 0.0,
              max: 20.0,
              divisions: 20,
              activeColor: Color(0xFF02401a),
              inactiveColor: Color(0xFF02401a),
              label: '${diezmo.round()}',
              onChanged: (double value) {
                Provider.of<Bubby>(context, listen: false).changeValue(value);
                setState(() {
                  diezmo = value;
                });
              }),
          Text('${diezmo.round()}' "%",
              style: GoogleFonts.dekko(
                  textStyle: TextStyle(
                      color: Color(0xFF02401a),
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}

class Bubby extends ChangeNotifier {
  double _currentValue;
  double get currentValue => _currentValue;

  void changeValue(double value) {
    _currentValue = value;
    notifyListeners();
  }

  Bubby(this._currentValue);
}
