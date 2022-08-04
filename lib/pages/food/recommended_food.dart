import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar (
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear,backgroundColor:Colors.white),
                AppIcon(icon: Icons.shopping_cart_outlined,backgroundColor: Colors.white,),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: Dimensions.font25,text: 'Korean Food',),),
                width: double.maxFinite, //화면 너비 최대로 확대
                padding: EdgeInsets.only(top:5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: Dimensions.sliverAppBarImageHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/food_image1.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "1. Hangover stew (해장국) Given South Korea's dedicated drinking culture, it's not surprising that its hangover-curing culture is equally as developed, from pre-drinking drinks to post-drinking drinks to a glorious array of spicy and steamy stews and soups.Made from a beef broth, with cabbage, bean sprouts, radish and chunks of congealed ox blood, the deeply satisfying taste does wonders to kick-start your sluggish brain in the morning. satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning.satisfying taste does wonders to kick-start your sluggish brain in the morning."),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),

                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        //이 문구가 없으면 화면 전체에 bottomNabigationBar가 출력됨
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*2.5,right: Dimensions.width20*2.5,top: Dimensions.height10,bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconsize24,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(text: "\$12.88 "+" X "+" 0 ",color: AppColors.mainColor,size: Dimensions.font25,),
                AppIcon(
                  iconSize: Dimensions.iconsize24,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20*2),
                  topLeft: Radius.circular(Dimensions.radius20*2),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20, left: Dimensions.width15,right: Dimensions.width15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  )
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  child: BigText(text:"\$10 Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
