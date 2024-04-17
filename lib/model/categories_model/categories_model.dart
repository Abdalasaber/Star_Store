import 'package:flutter/material.dart';
import 'package:star_store/views/screens/electronics/electronics_screen.dart';
import 'package:star_store/views/screens/men_clothing/men_clothing_screen.dart';

import '../../views/screens/jewelery/jewelery_screen.dart';
import '../../views/screens/women_clothing/women_clothing_screen.dart';

class CategoriesModel {
  String icon;
  String text;
  Widget screen;

  CategoriesModel({
    required this.icon,
    required this.text,
    required this.screen,
  });
}

List<CategoriesModel> itemCategoriesModel = [
  CategoriesModel(
      icon: 'assets/icons/men.svg',
      text: 'Men',
      screen: const MenClothingScreen()),
  CategoriesModel(
      icon: 'assets/icons/women.svg',
      text: 'Women',
      screen: const WomenClothingScreen()),
  CategoriesModel(
      icon: 'assets/icons/jewelry.svg',
      text: 'Jewelery',
      screen: const JeweleryScreen()),
  CategoriesModel(
      icon: 'assets/icons/Electronic.svg',
      text: 'Electronic',
      screen: const ElectronicsScreen()),
];
