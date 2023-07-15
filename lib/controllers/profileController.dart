import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:travenor/models/userModel.dart';

class ProfileController extends GetxController {
  Future<String> getDownloadUrl(File? image)async{
    try{
    int id = Random().nextInt(10000000)+1;
    Reference ref = FirebaseStorage.instance.ref(id.toString());
    UploadTask task = ref.putFile(image!);
    TaskSnapshot snapshot =  await task;
    return await snapshot.ref.getDownloadURL();
    }catch(e){
      Get.snackbar('Error', e.toString());
      return "error";
    }
  }
  void changeData(File? image, String firstName, String lastName, String phone, String addres) async{
    try{
      print('Hi');
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    UserModel user = UserModel.fromMap(snap.data() as Map<String,dynamic>);
    String FirstName = firstName.isNotEmpty ? firstName : user.firstName;
    String Address = addres.isNotEmpty ? addres : user.addres;
    String LastName = lastName.isNotEmpty ? lastName : user.lastName;
    String Phone = phone.isNotEmpty ? phone : user.phone;
    String imageUrl = await getDownloadUrl(image);
    String Image = image == null ? user.profilePic : imageUrl;
    print(addres);
    // UserModel userModelWithNewData = 
    String uid = user.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).set(UserModel(uid: user.uid, email: user.email, password: user.password, firstName: FirstName, lastName: LastName, profilePic: Image, addres: Address, phone: Phone).toMap());
    }catch(e){
      Get.snackbar('Error', e.toString());
    }
  }
}