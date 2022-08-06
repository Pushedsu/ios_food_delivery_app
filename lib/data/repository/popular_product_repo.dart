import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
//end point
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    //end point url 자리에 실제 url이 입력돠어야 함 ex)http://www.~~
    return await apiClient.getData(AppConstants.POPPULAR_PRODUCT_URI);

  }
}