import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travenor/models/hotelModel.dart';
import 'package:travenor/models/placeModel.dart';
import 'package:travenor/models/popularDestination.dart';
import 'package:travenor/views/screens/explore_screen.dart';

class PopularDestinationCorusel extends StatefulWidget {
  List<HotelModel> hotels;
   PopularDestinationCorusel({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  @override
  State<PopularDestinationCorusel> createState() => _PopularDestinationCoruselState();
}

class _PopularDestinationCoruselState extends State<PopularDestinationCorusel> {
  
  @override
  Widget build(BuildContext context) {
    for(int i=0; i<widget.hotels.length;i++){
      print(
        'hi'
      );
      print(widget.hotels[i].hotelCity);
    }
    return Container(
      height: 211,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularDestination.length,
          itemBuilder: (context, index) {
            TextEditingController textEditingController = TextEditingController.fromValue(TextEditingValue(text: popularDestination[index].nameOfCountry));
            return GestureDetector(
              onTap: (){
                Get.off(()=>ExploreScreen(controller: textEditingController, hotels: widget.hotels,isCountry: true,name: popularDestination[index].nameOfCountry,));
                
              },
              child:Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        popularDestination[index].image,
                        height: 211,
                        width: 160,
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularDestination[index].nameOfCountry,
                            style: GoogleFonts.poppins(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF)),
                          ),
                         
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
              )
            );
          }),
    );
  }
}