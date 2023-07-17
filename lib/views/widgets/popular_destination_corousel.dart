import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/models/placeModel.dart';
import 'package:travenor/models/popularDestination.dart';

class PopularDestinationCorusel extends StatefulWidget {
  const PopularDestinationCorusel({super.key});

  @override
  State<PopularDestinationCorusel> createState() => _PopularDestinationCoruselState();
}

class _PopularDestinationCoruselState extends State<PopularDestinationCorusel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 211,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularDestination.length,
          itemBuilder: (context, index) {
            return Container(
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
            );
          }),
    );
  }
}