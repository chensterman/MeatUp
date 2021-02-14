import 'package:aelo_prototype/screens/services/fireauth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
          title: Text('MeatUp'),
          backgroundColor: Colors.red[900],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.SignOutAnon();
                },
                icon: Icon(Icons.person),
                label: Text('Sign Out'))
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.message)),
            ],
          )),
    );
  }
}
