import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './widgets/section_one.dart';
import './widgets/section_two.dart';
import './widgets/section_three.dart';
import './widgets/right_input.dart';
import './widgets/left_input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          DisplayTop(),
          RecurringList(),
          OneTimeList(),
        ],
      )),
      bottomNavigationBar: Container(
        color: Colors.brown[50],
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                  height: 50.0,
                  child: GestureDetector(
                      onTap: () {
                        _onTapR();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_drop_up,
                            color: Colors.brown[600],
                          ),
                          Text("Input Recurring",
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 13.0,
                              ))),
                        ],
                      ))),
            ),
            Expanded(
              child: FloatingActionButton(
                elevation: 18.0,
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                onPressed: () {
                  Provider.of<Rubby>(context, listen: false).taken();
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("SAVE",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  color: Colors.green[300],
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w600))),
                      Icon(
                        Icons.done_outline,
                        size: 20.0,
                      ),
                      Text("ADD",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  color: Colors.green[300],
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w600)))
                    ]),
              ),
            ),
            Expanded(
              child: Container(
                  height: 50.0,
                  child: GestureDetector(
                      onTap: () {
                        _onTapO();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_drop_up,
                            color: Colors.brown[600],
                          ),
                          Text("Input One Time",
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 13.0,
                              ))),
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapR() {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Linput();
      },
    );
  }

  void _onTapO() {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Rinput();
      },
    );
  }
}

class Rubby extends ChangeNotifier {
  bool take;
  Rubby(this.take);
  void taken() => take = true;
  notifyListeners();
}
