import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/product/products_of_a_category.dart';

class ProductsProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  ProductsOfaCategory? _productsOfaCategory;
  late String images = '';
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<ProductsOfaCategory?> getProductsOfCategory({required String category}) async {
    _changeLoading();
    _productsOfaCategory = await productService.getProductsOfCategory(category: category);
    _changeLoading();
    notifyListeners();
    return null;
  }
}
