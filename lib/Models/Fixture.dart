class Fixture {

  final int fixtureID;
  final DateTime fixtureDate;
  final DateTime meetDate;
  final int clubID;
  final int teamID;
  final String oppositionClub;
  final String leagueCup;
  final String homeAway;
  final String fieldAddress;
  final String fieldPostcode;


  Fixture({required this.fixtureID, required this.fixtureDate, required this.meetDate, required this.clubID, required this.teamID,
    required this.oppositionClub, required this.leagueCup, required this.homeAway, required this.fieldAddress, required this.fieldPostcode});
}