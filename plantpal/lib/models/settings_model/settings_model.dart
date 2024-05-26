
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:plantpal/screens/about_screen/about_screen.dart';
import 'package:plantpal/utils/routes.dart';

class SettingItemModel {
  
  String title;
  IconData leading;
  void Function(BuildContext) onPress;

  SettingItemModel({required this.leading, required this.title, required this.onPress});
}


List<SettingItemModel> settingItems = [
  SettingItemModel(
    leading: EneftyIcons.shopping_bag_outline,
    title: "Your orders",
    onPress:(context) {
      
    },
  ),
    SettingItemModel(
    leading: EneftyIcons.heart_bold,
    title: "Favourites",
    onPress:(context) {
      
    },
  ),

    SettingItemModel(
    leading: EneftyIcons.info_circle_bold,
    title: "About us",
    onPress:(context) {
      Routes.push(const AboutScreen(), context);
    },
  ),
    SettingItemModel(
    leading: EneftyIcons.a_24_support_bold,
    title: "Support",
    onPress:(context) {
    },
  ),
];
