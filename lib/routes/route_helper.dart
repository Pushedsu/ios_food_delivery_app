import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:get/get.dart';
import '../pages/food/recommended_food.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";

  static getInitial()=>'$initial';
  static getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
  static getRecommendedFood()=>'$recommendedFood';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>FoodMainpage()),

    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      return PopularFoodDetail();
    },
      transition: Transition.fadeIn,
    ),

    GetPage(name: recommendedFood, page: (){
      return RecommendedFoodDetail();
    },
      transition: Transition.fadeIn,
    )
  ];
}