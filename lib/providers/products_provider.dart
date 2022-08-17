import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';
import '../screens/home/home_screen.dart';

class ProductsProvider extends ChangeNotifier {
  ProductService productService = ProductService();

  SingleProduct? productsOfaCategory;
  SingleProduct? phone;

  bool loading = false;

  Future<SingleProduct?> getProductsOfCategory({required String category}) async {
    loading = true;
    if (category == Category.smartphones.name) {
      phone = await productService.getProductsOfCategory(category: category);
    } else {
      productsOfaCategory =
          await productService.getProductsOfCategory(category: category);
    }
    loading = false;
    notifyListeners();
    return null;
  }
}
