// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/controllers/homeContoller.dart';

import 'package:travenor/models/hotelModel.dart';
import 'package:travenor/views/screens/home.dart';
import 'package:travenor/views/widgets/explore_text_field.dart';

class ExploreScreen extends StatefulWidget {
  TextEditingController controller;
  List<HotelModel> hotels;
  bool isCountry;
  String name;
  ExploreScreen({
    Key? key,
    required this.controller,
    required this.hotels,
    this.isCountry = false,
    required this.name,
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void dispose() {
    
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    HomeController homeController = Get.put(HomeController());
    late List<HotelModel> filteredHotels;
    for(int i=0; i<widget.hotels.length;i++){
      print(
        'hi'
      );
      print(widget.hotels[i].hotelCity);
    }
    if(!widget.isCountry){
  filteredHotels = widget.name.isEmpty ? homeController.videoList : (homeController.videoList.where((element) => element.hotelCity == widget.name)).toList();
    }else{

  filteredHotels = widget.name.isEmpty ? homeController.videoList : (homeController.videoList.where((element) => element.hotelCountry == widget.name)).toList();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),onPressed: (){
          Get.offAll(Home());
        },),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ExploreTextField(controller: widget.controller, onTap:(){
                Get.off(ExploreScreen(controller: widget.controller,hotels: widget.hotels,name: widget.controller.text,));
                
              }),
              Container(
                height: double.maxFinite,
                child: ListView.builder(itemCount: filteredHotels.length,itemBuilder: ((context, index) {
                  return Text(filteredHotels[index].hotelCity);
                })),
              )
            ],
          ),
        ],
      )
    );
  }
}
