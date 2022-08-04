import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget{
  final String text;
  const ExpandableTextWidget({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/4.9;

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
      child: secondHalf.isEmpty?SmallText(height:1.8,color:AppColors.paraColor,size:Dimensions.font16,text: firstHalf):Column(
        children: [
          //텍스트가 길때 상황
          SmallText(height: 1.8,color:AppColors.paraColor,size:Dimensions.font16,overflow:TextOverflow.visible,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
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
