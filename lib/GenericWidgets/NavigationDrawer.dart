import 'package:flutter/material.dart';
import 'package:sports_app/Services/Routes.dart';


class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {

    _drawerHeader() {
      return UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
        ),
        accountEmail: Text(
          'Team Email',
        ),
        accountName: Text(
          'Team Name',
        ),
        currentAccountPicture: CircleAvatar(
          radius: 85.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('Assets/old-cranleighan-rfc.png'),
        ),
      );
    }

    _drawerItem(String title, Icon icon, String routeName) {
      return ListTile(
        title: Text(title),
        leading: icon,
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, routeName);
        },
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          _drawerItem('Fixtures', Icon(Icons.event), Routes.fixtures),
          _drawerItem('Training', Icon(Icons.event), Routes.training),
          _drawerItem('Teams', Icon(Icons.group), Routes.team),
          _drawerItem('Updates', Icon(Icons.announcement), Routes.updates),
          _drawerItem('Results', Icon(Icons.format_list_numbered), Routes.results),
          _drawerItem('Members', Icon(Icons.contacts), Routes.members),
          _drawerItem('My Profile', Icon(Icons.account_circle), Routes.profile),
        ],
      ),
    );
  }
}