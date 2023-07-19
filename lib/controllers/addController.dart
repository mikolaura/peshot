import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:travenor/models/commentsModel.dart';
import 'package:travenor/models/hotelModel.dart';
import 'package:uuid/uuid.dart';

class AddController extends GetxController {
  Future<String> getImageUrl(File? image) async{
    try{
    var uuid = Uuid();

    Reference ref = FirebaseStorage.instance.ref().child('hotel').child(uuid.v4());
    UploadTask task = ref.putFile(image!);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
    }catch(e){
      Get.snackbar('Error', e.toString());
      return "";
    }
  }
  void addHotel(File? image,String hotelName, String hotelCountry,String hotelCity, String hotelPrice, String hotelDetail)async{
    try{
    String imageUrl = await getImageUrl(image);
    if(imageUrl.isEmpty){
      throw "error";
    }
    String id = Uuid().v4();
    HotelModel hotel = HotelModel(uid: id,hotelName: hotelName, hotelPrice: int.parse(hotelPrice), hotelImageUrl: imageUrl, hotelCountry: hotelCountry, hotelCity: hotelCity, comments: [commentModel(profilePic: '', username: 'username', commentText: "Text", commentId: Uuid().v4(), uid: FirebaseAuth.instance.currentUser!.uid, rating: 5)], hotelDetail: hotelDetail);
    FirebaseFirestore.instance.collection('hotels').doc(id).set(hotel.toMap());
     } catch(e){
      Get.snackbar('error', e.toString());
      return;
     }
  }
}