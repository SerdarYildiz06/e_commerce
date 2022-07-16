import 'package:dio/dio.dart';
import 'package:e_commerce/models/product/products_of_a_category.dart';
import 'package:e_commerce/utils/constants/api_constants.dart';

class ProductService {
  Dio dio = Dio();

  ProductService() {
    dio.options.baseUrl = ApiConstants.baseUrl;
  }

  Future<ProductsOfaCategory?> getProductsOfCategory({required String category}) async {
    Response response = await dio.get('${ApiConstants.getAllProducts}/$category',
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZyIsImlhdCI6MTY1Nzk3NDY5MCwiZXhwIjoxNjU3OTc4MjkwfQ.dvgYnOV2TFvKV6nvxHVrMNJt5waSjm_MZzU9_HAR4Ts'
          },
        ));
    print(response.data);
    print(response.statusCode);
    return null;
  }
}
