import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repository/LoginRepository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  LoginRepositoryImpl({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  String getUserEmail() {
    return _firebaseAuth.currentUser?.email ?? 'no mail';
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final authResult =  FirebaseAuth.instance.signInWithCredential(credential);
    return authResult.then((value) => value.user!);
  }

  @override
  Future<void> signOut() async {
    return _googleSignIn.signOut().then((value) => _firebaseAuth.signOut().then((value) => null));
  }
}
