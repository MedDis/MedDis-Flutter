import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gsc/utils/finite_state.dart';

class AuthProvider with ChangeNotifier, FiniteState {
  final googleSignIn = GoogleSignIn();
  String? _registerMessage;
  UserCredential? user;
  User? userData;
  bool isNormalLogin = false;

  String get registerMessage => _registerMessage!;

  Future reloadState() async {
    FirebaseAuth.instance.authStateChanges();
  }

  void getCurentUser() {
    userData = FirebaseAuth.instance.currentUser;
    // print(userData ?? 'kosong');
  }

  Future getReloadCurentUser() async {
    await FirebaseAuth.instance.currentUser!.reload();
    userData = FirebaseAuth.instance.currentUser!;
  }

  Future updateUsernamePicture(String newUsername, String newPhotoUrl) async {
    await userData?.updateDisplayName(newUsername);
    await userData?.updatePhotoURL(newPhotoUrl);

    await getReloadCurentUser();
    notifyListeners();
  }

  Future signInMailPass(String email, String pass) async {
    setStateAction(StateAction.loading);
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      // print(user!.user!.displayName);

      isNormalLogin = true;
      userData = user!.user;
      setStateAction(StateAction.none);
    } catch (e) {
      setStateAction(StateAction.none);
    }

    notifyListeners();
  }

  Future signInGoogle() async {
    final googleUser = await GoogleSignIn().signIn().onError(
      (error, stackTrace) {
        return null;

        // print('Error Mas broh $error');
      },
    );
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    user = await FirebaseAuth.instance.signInWithCredential(credential);
    isNormalLogin = false;
    userData = user!.user;

    notifyListeners();
  }

  Future<bool> signUp(String name, String email, String pass) async {
    setStateAction(StateAction.loading);
    _registerMessage = '';
    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      // print('create user success');
      isNormalLogin = true;
      userData = user!.user;
      // print('cekBro : ${userData!.emailVerified}');
      await userData!.sendEmailVerification();
      _registerMessage = "We have sent a verification link to $email";
      setStateAction(StateAction.none);
      // userData?.updateDisplayName(name);
      return true;
    } on FirebaseAuthException catch (e) {
      _registerMessage = "${e.message}";
      setStateAction(StateAction.error);
      return false;
    }
  }

  Future logOut() async {
    if (!isNormalLogin) {
      await googleSignIn.signOut();
    }
    await FirebaseAuth.instance.signOut();
    user = null;
  }
}
