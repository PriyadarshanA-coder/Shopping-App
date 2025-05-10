import 'package:flutter/material.dart';

class ProfileTextfield extends StatelessWidget {
  const ProfileTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.symmetric(horizontal: 25.0,vertical: 25.0),
    child: TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    ),
    );
  }
}
