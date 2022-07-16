import 'dart:convert';

class ProductsOfaCategory {
  ProductsOfaCategory(
      {required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  final String title;
  final String description;
  final String price;
  final String discountPercentage;
  final String stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductsOfaCategory copyWith({
    String? title,
    String? description,
    String? price,
    String? discountPercentage,
    String? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return ProductsOfaCategory(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'discountPercentage': discountPercentage});
    result.addAll({'stock': stock});
    result.addAll({'brand': brand});
    result.addAll({'category': category});
    result.addAll({'thumbnail': thumbnail});
    result.addAll({'images': images});

    return result;
  }

  factory ProductsOfaCategory.fromMap(Map<String, dynamic> map) {
    return ProductsOfaCategory(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      discountPercentage: map['discountPercentage'] ?? '',
      stock: map['stock'] ?? '',
      brand: map['brand'] ?? '',
      category: map['category'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      images: map['images'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory ProductsOfaCategory.fromJson(String source) =>
      ProductsOfaCategory.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductsOfaCategory(title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, stock: $stock, brand: $brand, category: $category,thumbnail: $thumbnail,images: $images,)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsOfaCategory &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.stock == stock &&
        other.brand == brand &&
        other.category == category &&
        other.thumbnail == thumbnail &&
        other.images == images;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      discountPercentage.hashCode ^
      stock.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      thumbnail.hashCode ^
      images.hashCode;
}
