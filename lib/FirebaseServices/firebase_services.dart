import 'package:firebase_database/firebase_database.dart';

class FirebaseServices {
  // Email users reference
  static final DatabaseReference emailDbRef = FirebaseDatabase.instance.ref("emailUsers");

  // Phone users reference
  static final DatabaseReference phoneDbRef = FirebaseDatabase.instance.ref("phoneUsers");


  // EMAIL

  static Future<bool> registerUserWithEmail({
    required String email,
    required String name,
    required String gender,
    required String dob,
  }) async {
    final bool alreadyExists = await checkIfEmailExists(email);

    if (alreadyExists) {
      return false;
    }

    final newUserRef = emailDbRef.push();
    await newUserRef.set({
      "email": email,
      "name": name,
      "gender": gender,
      "dob": dob,
    });
    return true;
  }

  static Future<bool> loginWithEmail(String email) async {
    return await checkIfEmailExists(email);
  }

  static Future<bool> checkIfEmailExists(String email) async {
    final snapshot = await emailDbRef.get();

    if (snapshot.exists) {
      for (final child in snapshot.children) {
        final data = child.value as Map?;
        if (data != null &&
            data['email']?.toString().toLowerCase() == email.toLowerCase()) {
          return true;
        }
      }
    }
    return false;
  }


  // PHONE

  static Future<bool> registerUserWithPhone({
    required String phone,
    required String name,
    required String gender,
    required String dob,
  }) async {
    final bool alreadyExists = await checkIfPhoneExists(phone);

    if (alreadyExists) {
      return false;
    }

    final newUserRef = phoneDbRef.push();
    await newUserRef.set({
      "phone": phone,
      "name": name,
      "gender": gender,
      "dob": dob,
    });
    return true;
  }

  static Future<bool> loginWithPhone(String phoneNumber) async {
    return await checkIfPhoneExists(phoneNumber);
  }

  static Future<bool> checkIfPhoneExists(String phoneNumber) async {
    final snapshot = await phoneDbRef.get();

    if (snapshot.exists) {
      for (final child in snapshot.children) {
        final data = child.value as Map?;
        if (data != null &&
            data['phone']?.toString().toLowerCase() == phoneNumber.toLowerCase()) {
          return true;
        }
      }
    }
    return false;
  }
}
