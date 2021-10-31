import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Team extends StatefulWidget {

  static const String routeName = '/team';

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'Team'
        ),
      ),
      body: Center(
        child: Text(
            'Team'
        ),
      ),
    );
  }
}
