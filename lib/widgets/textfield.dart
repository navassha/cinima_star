import 'package:flutter/material.dart';

import '../utils/cinima_star_responsive.dart';

// ignore: must_be_immutable
class TextfieldModel extends StatelessWidget {
  String hintText;
  Icon typeicon;
  String typetext;
  TextEditingController controller;
  void Function(String)? onChanged;
  TextfieldModel({
    super.key,
    required this.hintText,
    required this.controller,
    required this.typeicon,
    required this.typetext,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: ResMobSize.width(290, context),
      height: ResMobSize.width(47, context),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(
            ResMobSize.width(10, context),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: ResMobSize.width(15, context),
          ),
          prefixIcon: typeicon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ResMobSize.width(25, context),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ResMobSize.width(25, context),
            ),
          ),
          label: Text(typetext),
          labelStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: ResMobSize.width(15, context),
          ),
        ),
      ),
    );
  }
}
