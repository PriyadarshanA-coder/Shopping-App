import 'package:demo/profile_textfield.dart';
import 'package:demo/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  EditProfile ({super.key});

  final Color softBeige = Color(0xFFFDF6EC);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBeige,
      body: SafeArea(
        child: ListView(
          children:[
            Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 10),
                child: IconButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage(),),);
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
              ),
              SizedBox(width: 90),
              Text('Edit Profile',style: GoogleFonts.urbanist(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),

            ProfileTextfield(),

            ProfileTextfield(),

            ProfileTextfield(),
          ]
        ),
      ),
    );
  }
}