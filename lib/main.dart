import 'package:flutter/material.dart';

import 'PitListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pit Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PitPage(),
    );
  }
}

