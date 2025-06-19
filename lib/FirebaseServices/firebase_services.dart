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
    required String password,

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
      "password": password,

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
        if (data != null) {
          print("Checking email: ${data['email']} vs $email"); // debug log
          if (data['email']?.toString().toLowerCase() == email.toLowerCase()) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static Future<bool> checkPassword(String email, String enteredPassword) async {
    try {
      final snapshot = await emailDbRef.get();

      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        for (var entry in data.entries) {
          final user = entry.value as Map<dynamic, dynamic>;
          if (user['email'] == email) {
            // Compare passwords
            print('Checking password: stored=${user['password']} entered=$enteredPassword');
            return user['password'] == enteredPassword;
          }
        }
      }

      // Email not found
      return false;

    } catch (e) {
      print('Error checking password: $e');
      return false;
    }
  }



  // PHONE

  static Future<bool> registerUserWithPhone({
    required String phone,
    required String name,
    required String gender,
    required String dob,
    required String password,
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
      "password": password.toString(),
    });
    return true;
  }

  static Future<bool> loginWithPhone(String phone) async {
    return await checkIfPhoneExists(phone);
  }

  static Future<bool> checkIfPhoneExists(String phone) async {
    final snapshot = await phoneDbRef.get();

    if (snapshot.exists) {
      for (final child in snapshot.children) {
        final data = child.value as Map?;
        if (data != null &&
            data['phone']?.toString().toLowerCase() == phone.toLowerCase()) {
          return true;
        }
      }
    }
    return false;
  }

  static Future<bool> verifyPhonePassword({
    required String phone,
    required String password,
  }) async {
    final snapshot = await phoneDbRef.get();

    if (snapshot.exists) {
      for (final child in snapshot.children) {
        final data = child.value as Map?;
        if (data != null &&
            data['phone']?.toString().trim() == phone.trim() &&
            data['password']?.toString().trim() == password.trim()) {
          return true;
        }
      }
    }
    return false;
  }

  static Future<void> saveOrUpdateUserWithPhone({
    required String phone,
    required String name,
    required String gender,
    required String dob,
    required String password,
  }) async {
    final snapshot = await phoneDbRef.get();

    if (snapshot.exists) {
      for (final child in snapshot.children) {
        final data = child.value as Map?;
        if (data != null && data['phone']?.toString().trim() == phone.trim()) {
          await child.ref.update({
            "name": name,
            "gender": gender,
            "dob": dob,
            "password": password,
          });
          return;
        }
      }
    }

    final newUserRef = phoneDbRef.push();
    await newUserRef.set({
      "phone": phone,
      "name": name,
      "gender": gender,
      "dob": dob,
      "password": password,
    });
  }
}
