import 'package:firebase_database/firebase_database.dart';

class FirebaseServices {
  static Future<void> registerUserWithEmail({
    required String email,
    required String name,
    required String gender,
    required String dob,
  }) async {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref("emailUsers");

    final newUserRef = dbRef.push();

    await newUserRef.set({
      "email": email,
      "name": name,
      "gender": gender,
      "dob": dob,
    });
  }
}
