import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Updates extends StatefulWidget {

  static const String routeName = '/updates';

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'Updates'
        ),
      ),
      body: Center(
        child: Text(
            'Updates'
        ),
      ),
    );
  }
}

