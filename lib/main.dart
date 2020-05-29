import 'package:flutter/material.dart';
import './database/tithe_db.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import './widgets/display_slider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => database.dboneDao,
          dispose: (context, db) => database.close(),
        ),
        Provider(
          create: (_) => database.dbtwoDao,
          dispose: (context, db) => database.close(),
        ),
        ChangeNotifierProvider<Bubby>(
          create: (_) => Bubby(10),
        ),
        ChangeNotifierProvider(
          create: (_) => Rubby(true),
        ),
      ],
      child: MaterialApp(
        title: "Material App",
        home: HomePage(),
        theme: ThemeData(
            primaryColor: Color(0xFFd6bd78),
            accentColor: Color(0xFFd6bd78),
            hintColor: Color(0xFF02401a)),
      ),
    );
  }
}
