import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/views/screens/intro_screen.dart';
import 'package:travenor/views/widgets/mainButton.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(.0),
        child: Stack(
          children: [
            Image.asset(
              'assets/bgForSplash.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 59,
                ),
                // Image and Name
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/logoSplash.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Peshot',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Welcome to peshot Book easy and cheap hotels only on Peshot', 
                          textAlign: TextAlign.center,),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                // go next

                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          print('next page');
                          Get.to(IntroScreen());
                          // Get.
                        },
                        child: MainButton(
                          text: "Let`s Start",
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 39,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
