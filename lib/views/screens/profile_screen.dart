import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  void picImage()async{
    XFile? xFilePicked = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(xFilePicked!.path);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text("Edit Profile", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),),
          GestureDetector(
            onTap: picImage ,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[
                70
              ],
            ),
          )
    
        ],
      ),
    );
  }
}