import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/module/products_module.dart';
import 'package:get/get.dart';

//GetController state 관리
class PopularProductController extends GetxController{
  //repository
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  //제품 리스트를 list로 받기 위해 선언 및 초기화
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else{

    }
  }
}