import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  double sizeBoxWidth;

  IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.sizeBoxWidth=10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconsize24),
        SizedBox(width: sizeBoxWidth,),
        SmallText(text: text,),
      ]
    );
  }
}
