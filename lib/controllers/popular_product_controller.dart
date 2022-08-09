import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/module/products_module.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'cart_controller.dart';

//GetController state 관리
class PopularProductController extends GetxController{
  //repository
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  //제품 리스트를 list로 받기 위해 선언 및 초기화
  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    }
  }

  //increment 증가
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity=checkQuentity(_quantity+1);
    } else{
      _quantity=checkQuentity(_quantity-1);
    }
    update();
  }
  int checkQuentity(int quantity) {
    if(quantity<0){
      Get.snackbar("Item count", "You can't reduce more !",backgroundColor: AppColors.mainColor,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(15),);
      return 0;
    } else if(quantity>20){
      Get.snackbar("Item count", "You can't add more !",backgroundColor: AppColors.mainColor,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(15),);
      return 20;
    } else{
      return quantity;
    }
  }

  //제품 초기설정
  void initProduct(ProductModel product,CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart=cart;
    var exist=false;
    //cart에 항목이 있는지 없는지 여부 확인
    exist = _cart.existInCart(product);
    //if exist
    //get from storage _inCartItems
    print("exist or not "+exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print("the quantity in the cart is "+_inCartItems.toString());
  }

  void addItem(ProductModel product){
    if(_quantity>0){
      _cart.addItem(product, quantity);
      _quantity=0;
      _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print("The id is "+value.id.toString()+" The quantity is "+value.quantity.toString());
      });
    }else{
      Get.snackbar("Item count", "You should at least add an item in the cart !",backgroundColor: AppColors.mainColor,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(15),);
    }
  }
}