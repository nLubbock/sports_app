import 'package:flutter/material.dart';
import 'package:sports_app/Models/Fixture.dart';

class FixtureDetailsPage extends StatefulWidget {

  final Fixture fixture;
  FixtureDetailsPage({ this.fixture });

  @override
  _FixtureDetailsPageState createState() => _FixtureDetailsPageState();
}

class _FixtureDetailsPageState extends State<FixtureDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixture Details'),
      ),
      body: Center(
          child: Text( 'Fixture Details Page' )
      ),
    );
  }
}
