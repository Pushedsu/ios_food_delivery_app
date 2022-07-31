import 'package:flutter/material.dart';
import 'package:food_delivery/home/main_food_page.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Delivery App',
      home: Food_Main_page(),
    );
  }
}
