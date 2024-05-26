// ignore_for_file: must_be_immutable, file_names

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:plantpal/utils/app_colors.dart';

class SearchField extends StatefulWidget {



  TextEditingController controller;
  final ValueChanged onChanged;
  
  SearchField({
    super.key, 
    required this.controller, 
    required this.onChanged
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07), // Shadow color
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1.5), // Shadow position
          )
        ]),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller,
          style: TextStyle(color: AppColor.subTitleColor, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              prefixIcon: Icon(EneftyIcons.search_normal_outline, color: AppColor.iconColor),
              hintText: "Search plants, flowers...",
              border: InputBorder.none,
              filled: true,
              fillColor: AppColor.textfieldColor,
              contentPadding: const EdgeInsets.all(17)
            ),

          onChanged: widget.onChanged,  
        ),
      ),
    );
  }
}
