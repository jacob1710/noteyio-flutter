import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _authToken = '';
  late String _status;


  Future<String> loginWithEmail({
    @required email,
    @required pass}) async {
    try {
      final authResult =
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        print(authResult.user!.uid);
        _status = "successful";
      } else {
        _status = "undefined";
      }
    } catch (e) {
      print('Exception @login: $e');
      _status = "error";
    }
    return _status;
  }

  Future<bool> isUserLoggedIn() async {

    var user = _firebaseAuth.currentUser;

    if (user != null) {
      print('user:' + user.uid);
      final idToken = await user.getIdToken();
      _authToken = idToken;
      print('token:' + _authToken);
    } else {
      print('no user logged in');
    }
    return user != null;
  }

  logout() {
    print('AuthenticationService.logout()');
    _firebaseAuth.signOut();
  }

  Future<String> signUpWithEmail({
    @required email,
    @required pass}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (authResult.user != null) {
        _status = "successful";
      } else {
        _status = "undefined";
      }
    } catch (e) {
      print('Exception @signUpWithEmail: $e');
      _status = "Error";
    }
    return _status;
  }

  Future<String> getAuthToken() async {
    var user = _firebaseAuth.currentUser;
    final idToken = await user!.getIdToken();
    _authToken = idToken;
    print('user.getIdToken()->' + idToken);
    return _authToken;
  }

  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }

}
