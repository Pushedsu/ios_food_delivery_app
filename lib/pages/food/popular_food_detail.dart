import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //위젯들을 겹쳐서 쌓는 방식을 보여주는 위젯이다.
        children: [
          Positioned( //stack의 이미지나 텍스트의 위치를 조절하고 싶을 때 position 위젯을 사용한다
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "images/food_image1.png"
                    )
                )
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height40,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              //top: Dimensions.popularFoodImgSize,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
              ),
          ),
        ],
      ),
    );
  }
}