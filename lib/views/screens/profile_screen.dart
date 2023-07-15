// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travenor/controllers/profileController.dart';
import 'package:travenor/views/widgets/mainButton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());
  File? _image;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _secondNameController = TextEditingController();
  TextEditingController _addressNameController = TextEditingController();
  TextEditingController _phoneNameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    _addressNameController.dispose();
    _phoneNameController.dispose();
  }

  void picImage() async {
    XFile? xFilePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(xFilePicked!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            "Edit Profile",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          GestureDetector(
            onTap: picImage,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 45),
          TextFC(
            controller: _firstNameController,
            label: 'First Name',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFC(
            controller: _secondNameController,
            label: 'Second Name',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFC(
            controller: _addressNameController,
            label: 'Address',
          ),
          const SizedBox(
            height: 15,
          ),
          TextFC(
            controller: _phoneNameController,
            label: 'Phone',
            isPhone: true,
          ),
          const SizedBox(
            height: 45,
          ),
          GestureDetector(
              onTap: () {
                profileController.changeData(
                    _image,
                    _firstNameController.text,
                    _secondNameController.text,
                    _phoneNameController.text,
                    _addressNameController.text);
              },
              child: MainButton(
                  text: 'Save Data', color: Theme.of(context).primaryColor))
        ],
      ),
    );
  }
}

class TextFC extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool isPhone;
  TextFC({
    Key? key,
    required this.controller,
    required this.label,
    this.isPhone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            SizedBox(
              width: (MediaQuery.of(context).size.width) * 0.5,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.right,
                keyboardType:
                    isPhone ? TextInputType.phone : TextInputType.emailAddress,
              ),
            )
          ],
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
