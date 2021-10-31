import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Training extends StatefulWidget {

  static const String routeName = '/training';

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'Training'
        ),
      ),
      body: Center(
        child: Text(
            'Training'
        ),
      ),
    );
  }
}
