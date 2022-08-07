import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/module/products_module.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';

//GetController state 관리
class RecommendedProductController extends GetxController{
  //repository
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  //제품 리스트를 list로 받기 위해 선언 및 초기화
  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    } else{

    }
  }
}