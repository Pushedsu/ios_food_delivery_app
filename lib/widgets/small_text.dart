import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color; //글 컬러 선언
  final String text; // 텍스트 변수 선언
  double size; //글자 크기 선언
  double height;
  TextOverflow overflow;

  SmallText({
    Key? key,
    this.color=const Color(0xFFccc7c5),
    required this.text,
    this.height=1.2,
    this.size=0, // 글 크기 지정
    this.overflow=TextOverflow.ellipsis, //(ellipsis == 줄임말,생략이라는 뜻)텍스트의 길이가 일정 너비보다 길경우 글꼴을 잘라냅니다.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.font12:size,
        fontFamily: 'Roboto',
      ),
    );
  }
}