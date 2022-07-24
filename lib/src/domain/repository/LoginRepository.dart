import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<User> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  String getUserEmail();
}