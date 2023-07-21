import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travenor/models/hotelModel.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  final Rx<List<HotelModel>> _videoList = Rx<List<HotelModel>>([]);

  List<HotelModel> get videoList => _videoList.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _videoList.bindStream(
        FirebaseFirestore.instance.collection('hotels').snapshots().map((QuerySnapshot query) {
      List<HotelModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          HotelModel.fromMap(element.data() as Map<String,dynamic>),
        );
      }
      return retVal;
    }));
  }

}