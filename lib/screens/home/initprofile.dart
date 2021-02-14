import 'package:aelo_prototype/screens/services/fireauth.dart';
import 'package:aelo_prototype/screens/home/home.dart';
import 'package:flutter/material.dart';

class InitProfile extends StatefulWidget {
  @override
  _InitProfileState createState() => _InitProfileState();
}

class _InitProfileState extends State<InitProfile> {
  final AuthService _auth = AuthService();

  // Validation of entered values
  final _formKey = GlobalKey<FormState>();

  // Profile info
  String firstName = '';
  String lastName = '';
  String dob = '';
  String bio = '';

  Widget buildFirstName() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'First Name', icon: Icon(Icons.person)),
      validator: (val) => val.isEmpty ? 'Please enter your first name' : null,
      onChanged: (val) {
        setState(() => firstName = val);
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Last Name', icon: Icon(Icons.person)),
      validator: (val) => val.isEmpty ? 'Please enter your last name' : null,
      onChanged: (val) {
        setState(() => lastName = val);
      },
    );
  }

  Widget buildDob() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Date of Birth', icon: Icon(Icons.cake)),
      validator: (val) =>
          val.isEmpty ? 'Please enter your date of birth (mm/dd/yyyy)' : null,
      onChanged: (val) {
        setState(() => dob = val);
      },
    );
  }

  Widget buildBio() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration:
          InputDecoration(labelText: 'Bio', icon: Icon(Icons.text_fields)),
      validator: (val) =>
          val.isEmpty ? 'Please enter your date of birth' : null,
      onChanged: (val) {
        setState(() => bio = val);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Create Your Profile'),
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              buildFirstName(),
              buildLastName(),
              buildDob(),
              buildBio(),
              RaisedButton(
                color: Colors.red[900],
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
