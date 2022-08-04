import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  //785.4545454545455
  static double screenWidth = Get.context!.width;
  //392.72727272727275

  static double pageView = screenHeight/2.45;
  static double pageViewContainer = screenHeight/3.56;
  static double pageViewTextContainer = screenHeight/5.61;

  //dynamtic height margin and padding
  static double height10 = screenHeight/78.5;
  static double height15 = screenHeight/52.4;
  static double height20 = screenHeight/39.3;
  static double height30 = screenHeight/26.2;
  static double height40 = screenHeight/19.6;

  //dynamtic width margin and padding
  static double width1 = screenWidth/392.7;
  static double width10 = screenWidth/39.3;
  static double width15 = screenWidth/26.2;
  static double width20 = screenWidth/19.6;
  static double width30 = screenWidth/13.1;
  static double width40 = screenWidth/9.81;

  //font size
  static double font12 = screenHeight/65.5;
  static double font16 = screenHeight/49.1;
  static double font20 = screenHeight/39.3;
  static double font25 = screenHeight/31.4;

  //radius
  static double radius15 = screenHeight/52.4;
  static double radius20 = screenHeight/39.3;
  static double radius30 = screenHeight/26.2;

  //icon size
  static double iconsize24 = screenHeight/32.7;
  static double iconsize16 = screenHeight/49.1;

  //listview size
  static double listViewImgSize = screenWidth/3.27;
  static double listViewTextContSize = screenWidth/3.92;

  //popular food
  static double popularFoodImgSize = screenHeight/2.24;

  //bottom height
  static double bottomHeightBar = screenHeight/6.54;

  //SliverImage height
  static double sliverAppBarImageHeight = screenHeight/3.14;
}