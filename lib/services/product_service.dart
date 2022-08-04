import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/models/product/products_of_a_category.dart';
import 'package:e_commerce/utils/constants/api_constants.dart';

import 'hive_service/secure_storage_service.dart';

class ProductService {
  Dio dio = Dio();

  ProductService() {
    dio.options.baseUrl = ApiConstants.baseUrl;
  }

  Future<ProductOfCategory?> getProductsOfCategory({required String category}) async {
    final String? token = await SecureStorageService().get('token');

    Response response = await dio.get(
      '${ApiConstants.getAllProducts}/$category',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ProductOfCategory.fromJson(jsonBody);
      }
    }
    return null;
  }
}
