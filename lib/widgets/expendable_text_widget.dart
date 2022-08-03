import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimensions.dart';

class ExpendableTextWidget extends StatefulWidget{
  final String text;
  const ExpendableTextWidget({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpendableTextWidget> createState() => _ExpendableTextWidgetState();
}

class _ExpendableTextWidgetState extends State<ExpendableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/6.04; //화면에 표시된 크기 보고 다시 설정 100<x<200

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight) {
      firstHalf = widget.text.substring(0,textHeight.toInt()); //substring 인자 값으로 글자 첫 위치 끝나는 위치 정수로 설정(숫자는 글자의 인덱스)
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    } else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //텍스트가 적을 때 상황
      child: secondHalf.isEmpty?SmallText(height:1.8,color:AppColors.paraColor,size:Dimensions.iconsize16,text: firstHalf):Column(
        children: [
          //텍스트가 길때 상황
          SmallText(height: 1.8,color:AppColors.paraColor,size:Dimensions.font16,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          //container 위젯에는 별도의 제스터 기능을 제공하지 않아 inkwell 위젯을 통해 제스쳐 기능을 추가
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "show more ", color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
