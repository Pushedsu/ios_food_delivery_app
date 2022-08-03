import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font25,),
        SizedBox(height: Dimensions.height10,), //사이 빈공간을 넣기 위해서...
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,)),
            ),
            SizedBox(height: Dimensions.height10,width: Dimensions.width10,),
            SmallText(text: '4.5',),
            SizedBox(height: Dimensions.height10, width: Dimensions.width10,),
            SmallText(text: '1287 Comments',),
          ],
        ),
        SizedBox(height: Dimensions.height15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1
            ),
            SizedBox(width: Dimensions.width10,),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: '1.7km',
              iconColor: AppColors.mainColor,
            ),
            SizedBox(width: Dimensions.width10,),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppColors.iconColor2
            ),
            SizedBox(width: Dimensions.width10,),
          ],
        ),
      ],
    );
  }
}
