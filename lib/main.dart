import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:food_delivery/home/main_food_page.dart';
=======
import 'package:food_delivery/pages/home/main_food_page.dart';
>>>>>>> d5bed3f46e920227ef3b76be1af9884bfaa97e27
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
