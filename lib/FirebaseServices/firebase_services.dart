import 'package:firebase_database/firebase_database.dart';

class FirebaseServices {
  static Future<void> registerUserWithEmail({
    required String email,
    required String name,
    required String gender,
    required String dob,
    required String phone,
  }) async {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref("emailUsers");

    final newUserRef = dbRef.push();

    await newUserRef.set({
      "email": email,
      "name": name,
      "gender": gender,
      "dob": dob,
      "phone": phone,
    });
  }
  // Add this function to check if email already exists
  static Future<bool> checkIfEmailExists(String email) async {
    final DatabaseReference dbRef = FirebaseDatabase.instance.ref("emailUsers");
    final snapshot = await dbRef.get();

    if (snapshot.exists) {
      for (final child in snapshot.children) {
        final data = child.value as Map?;
        if (data != null && data['email']?.toString().toLowerCase() == email.toLowerCase()) {
          return true;
        }
      }
    }
    return false;
  }
}
