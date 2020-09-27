import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';
class LoginStore = _LoginStore with _$LoginStore;
abstract class _LoginStore with Store {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @observable
  User user;

  @action
  signInWithGoogle() async {
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    user = authResult.user;
  }
}