import 'package:flutter/material.dart';
import 'package:sports_app/GenericApp/Fixtures/Fixtures.dart';
import 'package:sports_app/GenericApp/Members/Members.dart';
import 'package:sports_app/GenericApp/Profile/Profile.dart';
import 'package:sports_app/GenericApp/Results/Results.dart';
import 'package:sports_app/GenericApp/Team/Team.dart';
import 'package:sports_app/GenericApp/Training/Training.dart';
import 'package:sports_app/GenericApp/Updates/Updates.dart';
import 'package:sports_app/Services/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Fixtures(),
      routes: {
        Routes.fixtures: (context) => Fixtures(),
        Routes.members: (context) => Members(),
        Routes.profile: (context) => Profile(),
        Routes.results: (context) => Results(),
        Routes.team: (context) => Team(),
        Routes.training: (context) => Training(),
        Routes.updates: (context) => Updates(),
      },
    );
  }
}
