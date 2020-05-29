import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../database/tithe_db.dart';
import 'package:provider/provider.dart';

class RecurringList extends StatefulWidget {
  const RecurringList({
    Key key,
  }) : super(key: key);

  @override
  _RecurringListState createState() => _RecurringListState();
}

class _RecurringListState extends State<RecurringList> {
  var controller2 = MoneyMaskedTextController();
  double daily;
  double monthly;
  double yearly;
  double weekly;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRecurring(context);
  }

  FutureBuilder _buildRecurring(BuildContext context) {
    final daoP = Provider.of<DboneDao>(context);

    return FutureBuilder<List<Dbone>>(
      future: daoP.getAllDbones(),
      builder: (context, AsyncSnapshot<List<Dbone>> snapshot) {
        final simple = snapshot.data ?? List();
        return Container(
          margin:
              EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0, top: 40.0),
          child: RaisedButton(
            onPressed: () => {},
            color: Colors.brown[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "RECURRING INCREASES",
                    style: GoogleFonts.sortsMillGoudy(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  children: <Widget>[
                    Text(
                      "◄Swipe Left To Delete Item",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Colors.brown[100],
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: simple.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final itemMember = simple[index];
                        controller2 = MoneyMaskedTextController(
                          initialValue: itemMember.value,
                          leftSymbol: '\$',
                          decimalSeparator: '.',
                          thousandSeparator: ',',
                        );
                        return Container(
                          height: 73.0,
                          margin: EdgeInsets.only(bottom: 5.0),
                          child: Card(
                            color: Colors.brown[50],
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
                                      daoP.deleteDbone(itemMember);
                                    });
                                  },
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
                                          daysToPeriod(itemMember.time)
                                              .toUpperCase(),
                                          style: GoogleFonts.sortsMillGoudy(
                                            textStyle: TextStyle(
                                              color: Colors.red[800],
                                              fontSize: 13.0,
                                              fontStyle: FontStyle.italic,
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
                                          height: 38.0,
                                          width: 130.0,
                                          child: TextField(
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                color: Colors.brown,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            controller: controller2,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,                                            
                                            onSubmitted: (controller3) {
                                              var val2 = controller3.replaceAll(
                                                  "\$", "");
                                              var val3 =
                                                  val2.replaceAll("\,", "");
                                              double val4 = double.parse(val3);
                                              final dao = Provider.of<DboneDao>(
                                                  context,
                                                  listen: false);
                                              final member = DbonesCompanion(
                                                id: Value(itemMember.id),
                                                benefit:
                                                    Value(itemMember.benefit),
                                                value: Value(val4),
                                                time: Value(itemMember.time),
                                                totalValue: Value(
                                                    val4 * itemMember.time),
                                              );
                                              dao.updateDbone(member);
                                            },
                                          ),
                                        ),
                                      ],
                                    )
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

String daysToPeriod(double period) {
  if (period == 12.0) {
    return "MONTHLY  ";
  } else if (period == 365.0) {
    return "DAILY  ";
  } else if (period == 52.0) {
    return "WEEKLY  ";
  } else if (period == 26.0) {
    return "BI-WEEKLY  ";
  } else if (period == 1.0) {
    return "YEARLY  ";
  }
}
