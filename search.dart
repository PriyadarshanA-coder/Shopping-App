import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final IconData? suffixIcon;
  final Color? iconColor;



  const Search({
    super.key,
    required this.controller,
    required this.hinText,
    this.suffixIcon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: iconColor ?? Colors.grey[600])
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
