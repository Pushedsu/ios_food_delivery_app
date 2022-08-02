import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:get/get.dart';

class Food_Main_page extends StatefulWidget {

  @override
  State<Food_Main_page> createState() => _Food_Main_pageState();
}

class _Food_Main_pageState extends State<Food_Main_page> {

  @override
  Widget build(BuildContext context) {
    print('current height is '+MediaQuery.of(context).size.height.toString());
    print('current height is '+MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          //상단 아이콘 텍스트
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20), //바깥쪽 여백
            padding: EdgeInsets.only(top: Dimensions.height40, bottom: Dimensions.height15), //안쪽 여백
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: 'Korean',color: AppColors.mainColor,size: Dimensions.font25,),
                    Row(
                      children: [
                        SmallText(text: 'city',size: Dimensions.font20,),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 40,
                  height: 45,
                  child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconsize24,),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                ),
              ],
            ),
          ),
          //중단, 하단 ui
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
