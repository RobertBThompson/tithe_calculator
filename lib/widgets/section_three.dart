import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../database/tithe_db.dart';
import 'package:provider/provider.dart';

class OneTimeList extends StatefulWidget {
  const OneTimeList({
    Key key,
  }) : super(key: key);

  @override
  _OneTimeListState createState() => _OneTimeListState();
}

class _OneTimeListState extends State<OneTimeList> {
  var controller4 = MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return _buildOneTime(context);
  }

  FutureBuilder _buildOneTime(BuildContext context) {
    final daoP = Provider.of<DbtwoDao>(context);
    return FutureBuilder<List<Dbtwo>>(
      future: daoP.getAllDbtwos(),
      builder: (context, AsyncSnapshot<List<Dbtwo>> snapshot) {
        final simple = snapshot.data ?? List();
        return Container(
          margin:
              EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0, top: 40.0),
          child: RaisedButton(
            onPressed: () => {},
            color: Color(0xFF708c7b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExpansionTile(
                  title: Text("ONE TIME INCREASES",
                      style: GoogleFonts.sortsMillGoudy(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500))),
                  children: <Widget>[
                    Text(
                      "◄Swipe Left To Delete Item",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Colors.green[100],
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: simple.length,
                      itemBuilder: (_, index) {
                        final itemMember = simple[index];
                        controller4 = MoneyMaskedTextController(
                          initialValue: itemMember.value,
                          leftSymbol: '\$',
                          decimalSeparator: '.',
                          thousandSeparator: ',',
                        );
                        return Container(
                          height: 73.0,
                          margin: EdgeInsets.only(bottom: 5.0),
                          child: Card(
                            color: Colors.green[50],
                            elevation: 2.0,
                            child: Slidable(
                              key: UniqueKey(),
                              actionPane: SlidableDrawerActionPane(),
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  color: Colors.redAccent,
                                  icon: Icons.delete,
                                  onTap: () {
                                    setState(() {
                                      daoP.deleteDbtwo(itemMember);
                                    });
                                  },
                                  // dao.deleteTask(item.task),
                                )
                              ],
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 5.0,
                                  right: 5.0,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "ONE TIME ",
                                          style: GoogleFonts.sortsMillGoudy(
                                            textStyle: TextStyle(
                                              color: Colors.red[800],
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${itemMember.benefit}'.toUpperCase(),
                                          style: GoogleFonts.sortsMillGoudy(
                                            textStyle: TextStyle(
                                              color: Colors.brown[800],
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          " value ",
                                          style: GoogleFonts.sortsMillGoudy(
                                            textStyle: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(6.0),
                                          height: 40.0,
                                          width: 140.0,
                                          child: TextField(
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                color: Color(0xFF597062),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            controller: controller4,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            onSubmitted: (controller5) {
                                              var val2 = controller5.replaceAll(
                                                  "\$", "");
                                              var val3 =
                                                  val2.replaceAll("\,", "");
                                              double val4 = double.parse(val3);
                                              final dao = Provider.of<DbtwoDao>(
                                                  context,
                                                  listen: false);
                                              final member = DbtwosCompanion(
                                                id: Value(itemMember.id),
                                                benefit:
                                                    Value(itemMember.benefit),
                                                value: Value(val4),
                                              );
                                              dao.updateDbtwo(member);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
