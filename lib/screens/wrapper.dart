import 'package:aelo_prototype/models/appuser.dart';
import 'package:aelo_prototype/screens/auth/auth.dart';
import 'package:aelo_prototype/screens/home/init.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return Home page or Auth page depending on logged in status
    final user = Provider.of<AppUser>(context);
    print(user);

    // Show page depending on sign in status
    if (user == null) {
      return Auth();
    } else {
      // Pass the user class into Init, that way it can use the uid to retrieve data later
      return Init(user: user);
    }
  }
}
