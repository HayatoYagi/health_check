import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {
  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  static User? _user = FirebaseAuth.instance.currentUser;

  static User? get user => _user;

  static bool get loggedIn => _user != null;

  static Future<void> signIn() async {
    GoogleSignInAccount? signInAccount = await googleLogin.signIn();
    if (signInAccount == null) return;
    GoogleSignInAuthentication auth = await signInAccount.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );
    _user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  static signOut() {
    googleLogin.signOut();
    FirebaseAuth.instance.signOut();
  }
}
