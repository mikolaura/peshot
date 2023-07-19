// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExploreTextField extends StatefulWidget {
  TextEditingController controller;
  Function() onTap;
  ExploreTextField({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ExploreTextField> createState() => _ExploreTextFieldState();
}

class _ExploreTextFieldState extends State<ExploreTextField> {
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      widget.controller.dispose();
      super.dispose();
    }
    return Container(
            height: 50,
            decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), offset: Offset(0, 4),blurRadius: 4)],
borderRadius: BorderRadius.circular(90),
            ),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                prefixIcon: IconButton(onPressed: widget.onTap,icon:Icon(Icons.search)),
                labelText: 'Search',
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                fillColor: Colors.white,
                filled: true,
                
              ),
              
            ),
          );
  }
}