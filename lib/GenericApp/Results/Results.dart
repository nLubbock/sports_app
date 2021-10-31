import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Results extends StatefulWidget {

  static const String routeName = '/results';

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'Results'
        ),
      ),
      body: Center(
        child: Text(
            'Results'
        ),
      ),
    );
  }
}
