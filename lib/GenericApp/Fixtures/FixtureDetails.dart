import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_app/Models/Fixture.dart';

class FixtureDetailsPage extends StatefulWidget {

  final Fixture fixture;
  final String team;
  FixtureDetailsPage({ required this.fixture, required this.team });

  @override
  _FixtureDetailsPageState createState() => _FixtureDetailsPageState();
}

enum AvailList {Available, Undecided, Unavailable}

class _FixtureDetailsPageState extends State<FixtureDetailsPage> {

  AvailList? _availability = AvailList.Undecided;
  String availability = 'Undecided';

  @override
  Widget build(BuildContext context) {

    DateFormat dateFormat = DateFormat("dd MMM yyyy");
    DateFormat dateFormat2 = DateFormat.Hm();

    _divider() {
      return Container(
        height: 1.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
      );
    }

    _titleTV(String opponent) {
      return Center(
        child: Column(
          children: [
            Text(
              'Opposition',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              opponent,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
              ),
            ),
          ],
        ),
      );
    }

    _dateTV(DateTime date){
      return Center(
        child: Column(
          children: [
            Text(
              'Date',
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            Text(
              dateFormat.format(date),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
              ),
            ),
          ],
        ),
      );
    }

    _subtitleTextView(String text, String detail) {
      return Center(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            Text(
              detail,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
              ),
            ),
          ],
        ),
      );
    }



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fixture Details'),
      ),
      body: Center(
        child: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fixture',
                          ),
                          _divider(),
                          SizedBox(height: 10.0),
                          _titleTV(widget.fixture.oppositionClub),
                          SizedBox(height: 10.0),
                          _dateTV(widget.fixture.fixtureDate),
                          SizedBox(height: 10.0),
                          _subtitleTextView('League / Cup', widget.fixture.leagueCup),
                          SizedBox(height: 10.0),
                          _subtitleTextView('Home / Away', widget.fixture.homeAway),
                          SizedBox(height: 10.0),
                          _subtitleTextView('Meet Time',dateFormat2.format(widget.fixture.meetDate)),
                          SizedBox(height: 10.0),
                          _subtitleTextView('Kick Off', dateFormat2.format(widget.fixture.fixtureDate)),
                          SizedBox(height: 10.0),
                        ],
                      ),
                      MaterialButton(
                          elevation: 0.0,
                          minWidth: 10.0,
                          child: Column(
                            children: [
                              Icon(
                                Icons.event,
                              ),
                            ],
                          ),
                        onPressed: () async {
                          Add2Calendar.addEvent2Cal(
                            Event(
                              title: 'OCRFC Fixture',
                              description: 'Game vs ' + widget.fixture.oppositionClub,
                              location: widget.fixture.fieldAddress + ', ' + widget.fixture.fieldPostcode,
                              startDate: widget.fixture.meetDate,
                              endDate: widget.fixture.fixtureDate,
                            ),
                          ).then((success) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    success ? 'This fixture has been added to your calendar'
                                        : 'Sorry there was an error, try again later',

                                  ))
                            );
                          });
                        }
                      )
                    ],
                  ),
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Availability',
                      ),
                      _divider(),
                      SizedBox(height: 10.0),
                      _subtitleTextView('You are currently:', availability),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          'Change your availability:',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Center(
                        child: RadioListTile(
                          dense: true,
                          activeColor: Colors.green,
                          title: const Text('Available'),
                          value: AvailList.Available,
                          groupValue: _availability,
                          onChanged: (AvailList? value) {
                            setState(() {
                              _availability = value;
                              availability = 'Available';
                            });
                          },
                        ),
                      ),
                      RadioListTile(
                        dense: true,
                        activeColor: Colors.orange,
                        title: const Text('Undecided'),
                        value: AvailList.Undecided,
                        groupValue: _availability,
                        onChanged: (AvailList? value) {
                          setState(() {
                            _availability = value;
                            availability = 'Undecided';
                          });
                        },
                      ),
                      RadioListTile(
                        dense: true,
                        activeColor: Colors.red,
                        title: const Text('Unavailable'),
                        value: AvailList.Unavailable,
                        groupValue: _availability,
                        onChanged: (AvailList? value) {
                          setState(() {
                            _availability = value;
                            availability = 'Unavailable';
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}
