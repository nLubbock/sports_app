import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Fixtures extends StatefulWidget {

  static const String routeName = '/fixtures';

  @override
  _FixturesState createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'OCRFC Fixtures'
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
              'Fixtures'
          ),
        ),
      ),
    );
  }
}
