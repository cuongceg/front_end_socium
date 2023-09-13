import 'package:app/services/database.dart';
import 'package:app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class AuthService{
  final FirebaseAuth auth=FirebaseAuth.instance;
  MyUser? userFromFirebase(User? user){
    return user!=null ? MyUser(uid:user.uid):null;
  }
  Stream<MyUser?> get user{
    return auth.authStateChanges().map(userFromFirebase);
  }
  Future signUpEmail(String email,String password)async{
    try{
      UserCredential result= await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      //create a doc with uid above
      await DatabaseService(uid:'0').updateDatabase('12','00','Đỗ Mạnh Cường','N&F','Calculus 1','true','A default group','No');
      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async{
    try{
      return auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signInemailandpassword(String email,String password) async{
    try{
      UserCredential result= await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user= result.user;
      return userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future<UserCredential>signInFacebook()async{
    final LoginResult result = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  Future signInGoogle() async {
    try{
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth!.idToken,
          accessToken: googleAuth.accessToken
      );
      UserCredential userCredential = await auth.signInWithCredential(credential);
      print(userCredential.user!.displayName);
    }
    catch(e){
      print(e.toString());
    }
  }
}