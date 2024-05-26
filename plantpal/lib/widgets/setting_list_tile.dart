// ignore_for_file: must_be_immutable

import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:plantpal/utils/app_colors.dart';

class SettingListTile extends StatelessWidget {
  IconData leading;
  String title;
  VoidCallback ontap;

  SettingListTile({super.key, required this.leading, required this.title,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: AppColor.imgBgColor,
          child: Icon(
            leading,
            color: AppColor.primaryColor,
          )),
      title: Text(title),
      trailing: Icon(
        EneftyIcons.arrow_right_3_outline,
        color: AppColor.primaryColor,
      ),

      onTap: ontap,
    );
  }
}
