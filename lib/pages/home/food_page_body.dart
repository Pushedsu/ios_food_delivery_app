import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85); //페이지 이동 컨트롤러 viewportFractoin 이전 이후 페이지의 모습이 어느정도 보일지 설정
  var _currPageValue=0.0;
  double _ScaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState() { //상태 초기화
    super.initState();
    pageController.addListener(() {
      setState((){
        _currPageValue = pageController.page!;
        //print("현재 페이지의 vlaue 값: "+_currPageValue.toString());
      });
    });
  }
  @override
  void dispose() { //상태 종료
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          //color: Colors.redAccent, //뒷 배경 컨테이너 범위 확인용
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context,position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: Dimensions.height30,),
        //popular text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end, //crossAxis는 주축의 반대인 횡축의 레이아웃을 관여한다.
            children: [
              BigText(text: 'Popular',color: AppColors.mainBlackColor,),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: BigText(text: ".", color: AppColors.textColor,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing',color: AppColors.textColor,size: Dimensions.font12,),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height30,),
        ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width20, bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "images/food_image1.png"
                              )
                          )
                      ),
                    ),
                    //text section
                    Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius15)
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: 'Nutritious fruit meal in Korean'),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: 'With Korean characteristics'),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: 'Normal',
                                        iconColor: AppColors.iconColor1,
                                        sizeBoxWidth: Dimensions.width1,
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                    IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: '1.7km',
                                      iconColor: AppColors.mainColor,
                                      sizeBoxWidth: Dimensions.width1,
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: '32min',
                                        iconColor: AppColors.iconColor2,
                                        sizeBoxWidth: Dimensions.width1,
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix= new Matrix4.identity(); //Matrix4는 3차원 좌표를 3차원 다른 좌표로 투영시키는데 사용되는 matrix
    if(index==_currPageValue.floor()) {
      var currScale = 1-(_currPageValue-index)*(1-_ScaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans, 0);

    } else if(index==_currPageValue.floor()+1) {
      var currScale = _ScaleFactor+(_currPageValue-index+1)*(1-_ScaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans, 0);

    } else if(index==_currPageValue.floor()-1) {
      var currScale = 1-(_currPageValue-index)*(1-_ScaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans, 0);

    } else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-_ScaleFactor)/2,0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15), //둥근 형의 위젯 모형을 만들기 위해...
                image: const DecorationImage(
                    fit: BoxFit.cover, //이미지 모양 들어가기 위해...
                    image: AssetImage(
                        "images/food_image1.png"
                    )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5.0,
                    offset: Offset(0, 10), // changes position of shadow
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,right: Dimensions.width10,left: Dimensions.width10),
                child: AppColumn(text:  "Korean Food",),
              ),
            ),
          )
        ],
      ),
    );
  }
}

