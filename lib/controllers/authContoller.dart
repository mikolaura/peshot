import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travenor/models/userModel.dart';
import 'package:travenor/views/screens/auth/sign_up_screen.dart';
import 'package:travenor/views/screens/home.dart';
import 'package:travenor/views/screens/start_screen.dart';

class AuthContoller extends GetxController {
  static AuthContoller authContoller = Get.find();
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
     _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user,_setInitialScreen);
  }
  void _setInitialScreen(User? user){
    if (user == null){
      Get.offAll(()=>StartScreen());
    }else{
      Get.offAll(()=>Home());
    }
  }
  void logIn(String email, String password){
    try{
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password); 
    }catch(e){
      Get.snackbar('error on log in', e.toString());
    }
  }
  void signUp(
      String firstName, String lastName, String email, String password) async {
    try{
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel user = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        profilePic: '',
        addres: '',
        phone: '');
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());
      
    }catch(e){
      Get.snackbar('error',e.toString());
    }
  }
}
