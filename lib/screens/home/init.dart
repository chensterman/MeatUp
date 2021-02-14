import 'package:aelo_prototype/models/appuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aelo_prototype/screens/home/home.dart';
import 'package:aelo_prototype/screens/home/initprofile.dart';

class Init extends StatelessWidget {
  final AppUser user;
  Init({this.user});

  String initCheck;
  Future<String> getData() async {
    final ds = await FirebaseFirestore.instance
        .collection('profiles')
        .doc(user.uid)
        .get();
    return ds['first_name'];
  }

  @override
  Widget build(BuildContext context) {
    getData().then((s) {
      initCheck = s;
    });
    if (initCheck == null) {
      return InitProfile();
    } else {
      return Home();
    }
  }
}
