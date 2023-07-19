import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travenor/models/hotelModel.dart';
import 'package:travenor/models/placeModel.dart';
import 'package:travenor/views/screens/explore_screen.dart';

class PlaceContoller extends StatefulWidget {
  List<HotelModel> hotels;
  PlaceContoller({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  @override
  State<PlaceContoller> createState() => _PlaceContollerState();
}

class _PlaceContollerState extends State<PlaceContoller> {
  
  @override
  Widget build(BuildContext context) {
    print('hi');
    for(int i=0; i<widget.hotels.length;i++){
      print(
        'hi'
      );
      print(widget.hotels[i].hotelCity);
    }
    return Container(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (context, index){
            TextEditingController textEditingController = TextEditingController.fromValue(TextEditingValue(text: places[index].placeName));
            return GestureDetector(
              onTap: (){
                Get.off(()=>ExploreScreen(controller: textEditingController, hotels: widget.hotels,name: places[index].placeName,));

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          places[index].image,
                          height: 370,
                          width: 270,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      bottom: 25,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              places[index].placeName,
                              style: GoogleFonts.poppins(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF)),
                            ),
                            Container(
                              width: 60,
                              height: 2,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                                width: 208,
                                child: Text(
                                  places[index].bio,
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Color(0xFFFFFFFF),
                                      letterSpacing: 0.7,
                                      wordSpacing: 0.1),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
