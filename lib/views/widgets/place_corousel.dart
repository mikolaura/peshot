import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/models/placeModel.dart';

class PlaceContoller extends StatefulWidget {
  const PlaceContoller({super.key});

  @override
  State<PlaceContoller> createState() => _PlaceContollerState();
}

class _PlaceContollerState extends State<PlaceContoller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (context, index) {
            return Container(
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
            );
          }),
    );
  }
}
