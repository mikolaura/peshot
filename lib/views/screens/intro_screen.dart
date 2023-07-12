import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/views/screens/auth/log_in_screen.dart';
import 'package:travenor/views/screens/auth/sign_up_screen.dart';
import 'package:travenor/views/widgets/mainButton.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          //image
          Image.asset(
            'assets/intro.png',
            height: 250,
            width: 300,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),

          // Text
          Column(
            children: [
              Text(
                'Plan your trip',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'Custom and fast planning with a low price',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),

          //Buttons

          Column(
            children: [
              GestureDetector(
                  onTap: () => Get.to(LogInScreen()),
                  child: MainButton(
                      text: 'Log In',
                      color: Theme.of(context).primaryColor)
                    ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: ()=>Get.to(SignUpScreen()),
                child: MainButton(
                  text: 'Creata account',
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
