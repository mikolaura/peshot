import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travenor/controllers/addController.dart';
import 'package:travenor/views/widgets/custom_text_field.dart';
import 'package:travenor/views/widgets/mainButton.dart';
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? image;
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController hotelCountryController = TextEditingController();
  TextEditingController hotelCityController = TextEditingController();
  TextEditingController hotelPriceController = TextEditingController();
  TextEditingController hotelDetailController = TextEditingController();
  AddController addController = Get.put(AddController());
  void pick() async{
    XFile? imagePicked = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    hotelCityController.dispose();
    hotelCountryController.dispose();
    hotelDetailController.dispose();
    hotelNameController.dispose();
    hotelPriceController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0/1.5),
      child: ListView(
        children: [
          GestureDetector( 
            onTap: pick,
            child:  new Container(
              width: 200,
              height: 300,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage('assets/london.png'),
              // fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
          ),
          const SizedBox(height: 40,),
          CustomTextField(controller: hotelNameController, hintText: "Hotel Name", isObscure: false, ),
          const SizedBox(height: 20,),
          CustomTextField(controller: hotelCountryController, hintText: "Hotel Country", isObscure: false, ),
          const SizedBox(height: 20,),
          CustomTextField(controller: hotelCityController, hintText: "Hotel City", isObscure: false, ),
          const SizedBox(height: 20,),
          CustomTextField(controller: hotelPriceController, hintText: "Hotel Price", isObscure: false,type: TextInputType.number, ),
          const SizedBox(height: 20,),
          Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), offset: Offset(0, 4),blurRadius: 4)],
        borderRadius: BorderRadius.circular(90),
        ),
        child:  TextField(
            controller: hotelDetailController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: 'Hotel Details',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none
            )
          ),
            keyboardType: TextInputType.multiline,
            minLines: 1, // <-- SEE HERE
            maxLines: 5, // <-- SEE HERE
          )
          ),
          const SizedBox(height: 40,),
          GestureDetector(onTap: (){
            print("Hi add");
            addController.addHotel(image, hotelNameController.text, hotelCountryController.text, hotelCityController.text, hotelPriceController.text, hotelDetailController.text);

          },child: MainButton(text: "Add Hotel", color: Theme.of(context).primaryColor))
          ],
      ),
    );
  }
}