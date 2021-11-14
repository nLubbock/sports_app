import 'package:flutter/material.dart';
import 'package:sports_app/GenericWidgets/NavigationDrawer.dart';
import 'FixtureDetails.dart';
import 'package:sports_app/Models/Fixture.dart';
import 'package:intl/intl.dart';


class Fixtures extends StatefulWidget {

  static const String routeName = '/fixtures';

  @override
  _FixturesState createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {

  String _team = '1st XV';

  @override
  Widget build(BuildContext context) {

    final List fixtures = [Fixture(fixtureID: 1,
        fixtureDate: DateTime(2021, 11, 07, 13, 30),
        meetDate: DateTime(2021, 11, 07, 12),
        clubID: 1,
        teamID: 1,
        oppositionClub: 'Old Emanuel',
        leagueCup: 'League',
        homeAway: 'Home',
        fieldAddress: 'The OC Club',
        fieldPostcode: 'KT7 0HB'),
      Fixture(fixtureID: 1,
          fixtureDate: DateTime(2021, 24, 07, 13),
          meetDate: DateTime(2021, 24, 07, 12),
          clubID: 1,
          teamID: 1,
          oppositionClub: 'Old Emanuel',
          leagueCup: 'League',
          homeAway: 'Home',
          fieldAddress: 'The OC Club',
          fieldPostcode: 'KT7 0HB')];
    
    final List _teams = [
      '1st XV',
      '2nd XV',
      'B XV'
    ];




    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            child: Row(
              children: [
                Text(_team),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            itemBuilder: (BuildContext context) {
              return _teams.map((team) {
                return PopupMenuItem<String>(
                  value: team,
                  child: Text(team),
                );
              }).toList();
            },
            onSelected: (String value) {
              setState(() {
                _team = value;
              });
            },
          )
        ],
        title: Text(
            'Fixtures'
        ),
      ),
      body: fixtures.length == 0 ? Center(child: Text('No Upcoming Fixtures'))
        : ListView.builder(
        itemCount: fixtures.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: FixtureTile(fixture: fixtures[index], team: _team),
          );
        },
      ),
    );
  }
}

class FixtureTile extends StatefulWidget {

  final Fixture fixture;
  final String team;
  FixtureTile({ required this.fixture, required this.team });

  @override
  _FixtureTileState createState() => _FixtureTileState();
}

class _FixtureTileState extends State<FixtureTile> {

  DateFormat dateFormat1 = DateFormat("dd MMM");
  DateFormat dateFormat2 = DateFormat("E");
  DateFormat dateFormat3 = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          SizedBox(height: 4.0),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FixtureDetailsPage(fixture: widget.fixture, team: widget.team),
                  )
              );
            },
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                dateFormat2.format(widget.fixture.fixtureDate),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                dateFormat1.format(widget.fixture.fixtureDate),
                              ),
                            ],
                          ),
                          SizedBox(width: 25.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.team + ' ' + widget.fixture.oppositionClub,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text('Kick Off: ' + dateFormat3.format(widget.fixture.fixtureDate)),
                              SizedBox(height: 5.0),
                              Text('Click for more information'),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),
          SizedBox(height: 2.0),
        ],
      ),
    );
  }
}