// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/views/widgets/explore_text_field.dart';

class ExploreScreen extends StatefulWidget {
  TextEditingController controller;
  ExploreScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void dispose() {
    
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ExploreTextField(controller: widget.controller, onTap:(){
            Get.off(ExploreScreen(controller: widget.controller));
          })
        ],
      )
    );
  }
}
