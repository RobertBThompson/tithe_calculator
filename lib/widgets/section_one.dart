import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'display_calc_one.dart';
import 'display_calc_two.dart';
import 'display_slider.dart';

class DisplayTop extends StatefulWidget {
  @override
  _DisplayTopState createState() => _DisplayTopState();
}

class _DisplayTopState extends State<DisplayTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316,
      child: Column(
        children: <Widget>[
          Container(height: 36.0),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Column(children: <Widget>[
              Container(
                  height: 30.0,
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[                        
                        Text("TITHE CALCULATOR  ",
                            style: GoogleFonts.sortsMillGoudy(
                                textStyle: TextStyle(
                                    color: Color(0xFF02401a),
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w600))),
                      ])),
              Container(
                  height: 30.0,
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[                        
                        Text("~ breakdown \"interest annually\"  ",
                            style: GoogleFonts.sortsMillGoudy(
                                textStyle: TextStyle(
                                    color: Color(0xFF02401a),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400))),
                      ])),
              Bub(),
            ]),
          ),
          Container(
              margin: EdgeInsets.only(left: 3.0, right: 3.0),
              padding: EdgeInsets.only(bottom: 13.0, top: 13.0),
              decoration: BoxDecoration(
                  color: Colors.brown[50],
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0))),
              child: Column(children: <Widget>[
                Sub(),
                Container(
                  padding: EdgeInsets.only(left: 18.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "RECURRING CALCULATIONS",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF543f03),
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                    child: Divider(
                  indent: 18.0,
                  endIndent: 18.0,
                  thickness: 1.0,
                  color: Color(0xFF543f03),
                )),
                Container(
                    padding: EdgeInsets.only(left: 22.0, right: 12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("ADD",
                              style: GoogleFonts.indieFlower(
                                  textStyle: TextStyle(
                                      color: Color(0xFF02401a),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600))),
                          Text("\u2192 ",
                              style: GoogleFonts.indieFlower(
                                  textStyle: TextStyle(
                                      color: Color(0xFF02401a),
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600))),
                          RaisedButton(
                              onPressed: () => {},
                              elevation: 12.0,
                              color: Color(0xFFa3b5aa),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              child: Tub()),
                        ])),
              ])),
        ],
      ),
    );
  }
}
