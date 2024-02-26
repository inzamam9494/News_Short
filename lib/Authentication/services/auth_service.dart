import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  signInWithGoogle() async{
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // facebook on firebase
  // https://newsapp-de375.firebaseapp.com/__/auth/handler

  signInWithFacebook() async{
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw FirebaseAuthException(
          code: 'Facebook Login Failed',
          message: 'The Facebook login was not successful.',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication exceptions
      if (kDebugMode) {
        print('Firebase Auth Exception: ${e.message}');
      }
      rethrow; // rethrow the exception
    } catch (e) {
      // Handle other exceptions
      if (kDebugMode) {
        print('Other Exception: $e');
      }
      rethrow; // rethrow the exception
    }
  }
}

// <meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
// <meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>
// <meta-data
// android:name="flutterEmbedding"
// android:value="2" />