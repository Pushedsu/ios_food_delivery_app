import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

//end point
class RecommendedProductRepo extends GetxService{

  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    //end point url 자리에 실제 url이 입력돠어야 함 ex)http://www.~~
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}