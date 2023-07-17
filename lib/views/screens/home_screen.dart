// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travenor/views/screens/explore_screen.dart';
import 'package:travenor/views/widgets/explore_text_field.dart';
import 'package:travenor/views/widgets/place_corousel.dart';
import 'package:travenor/views/widgets/popular_destination_corousel.dart';
class HomeScreen extends StatefulWidget {
  Function() change;
  HomeScreen({
    Key? key,
    required this.change,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> { 
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          ExploreTextField(controller: controller,onTap: (){
            print("Hii");
            Get.off(()=>ExploreScreen(controller: controller));
          },),
          const SizedBox(height: 50,),
          PlaceContoller(),
          const SizedBox(height: 50,),
          Text('Popular Destination', style: GoogleFonts.montserrat(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black )),
          PopularDestinationCorusel()
        ],
      ),
    );
  }
}