
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travenor/views/widgets/custom_text_field.dart';
import 'package:travenor/views/widgets/mainButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromRGBO(239, 239, 239, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(239, 239, 239, 1),
            elevation: 0,
          ),
          body: ListView(
                
                  children: [SizedBox(
                    height: double.maxFinite,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Column(

                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO:
                        
                          //Text sign up
                          Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                         
                          //Custom TextField
                          SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.15,
                          ),
                          CustomTextField(controller: _firstNameController, hintText: "First Name", isObscure: false),
                          const SizedBox(height: 5,),
                          CustomTextField(controller: _lastNameController, hintText: "Last Name", isObscure: false),
                          const SizedBox(height: 5,),
                          CustomTextField(controller: _emailController, hintText: "Email", isObscure: false),
                          const SizedBox(height:5,),
                          CustomTextField(controller: _passwordController, hintText: "Password", isObscure: true),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height) * 0.15,
                          ),
                          //Custom Button
                          Center(child: MainButton(text: 'Sign Up', color: Theme.of(context).primaryColor))
                        ],
                      ),
                    ),
                  ),
]              ),
          
            
          );
  }
}
