import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
 // final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  return googleSignInAccount.displayName;
}


void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}