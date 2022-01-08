import 'package:firebase_auth/firebase_auth.dart';

class Queries {
  late String email;
  late String password;
  User? user;
  String errorMessage = '';

  FirebaseAuth auth;

  Queries(this.auth);

  registerUser() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      errorMessage = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The Password Is Too Weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Email Is Already In Use';
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      errorMessage = "Catch Error";
    }
  }

  loginUser() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      errorMessage = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'User With This Email Not Exists';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Invalid Password For This Email/User';
      }
    }
  }

  signOut() async {
    await auth.signOut();
  }

  Stream<User?> get isAuthenticated => auth.authStateChanges();
}
