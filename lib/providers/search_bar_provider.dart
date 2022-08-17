import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class SearchBarProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  SingleProduct? singleProduct;
  bool loading = false;
  TextEditingController searchController = TextEditingController();

  Future<SingleProduct?> getSingleProduct({required String product}) async {
    loading = true;
    singleProduct = await productService.getSearchProduct(product: product);
    loading = false;
    notifyListeners();
    return null;
  }
}
