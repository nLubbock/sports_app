import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';

class Profile extends StatefulWidget {

  static const String routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
            'My Profile'
        ),
      ),
      body: Center(
        child: Text(
          'My Profile'
        ),
      ),
    );
  }
}
