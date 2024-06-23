import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saidoffapp/core/router/name_routes.dart';

class GoogleLoginService {
  static Future<User?> googlLogin(BuildContext context) async {
    UserCredential? userCredential;
    GoogleSignInAccount? signInAccount = await GoogleSignIn().signIn();
    if (signInAccount != null) {
      GoogleSignInAuthentication gauth = await signInAccount.authentication;

      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken,
        idToken: gauth.idToken,
      );
      userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      context.goNamed(Routes.home);
      debugPrint(
        userCredential.user.toString(),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Xatolik'),
        ),
      );
    }
    return userCredential!.user;
  }
}
