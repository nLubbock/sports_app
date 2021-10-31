import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Members extends StatefulWidget {

  static const String routeName = '/members';

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'OCRFC Members'
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
              'Members Page'
          ),
        ),
      ),
    );
  }
}
