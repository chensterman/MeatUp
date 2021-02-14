import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Collection reference
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profiles');

  final String uid;
  DatabaseService({this.uid});

  Future updateUserData(
    String firstName,
    String lastName,
    String dob,
    String bio,
  ) async {
    return await profileCollection.doc(uid).set({
      'first_name': firstName,
      'last_name': lastName,
      'age': dob,
      'bio': bio,
    });
  }
}
