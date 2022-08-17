import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Products id;
  const ProductDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final int _current = 0;
  final CarouselController _controller = CarouselController();
  bool loading = false;
  SingleProduct? _productOfCategory;
  late final List<String>? items = widget.id.images;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("All items" + items.toString());
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    widget.id.title.toString(),
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(),
                    items: items!
                        .map((e) => SizedBox(
                              height: 300,
                              width: 300,
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                        e,
                                        fit: BoxFit.cover,
                                      ))),
                            ))
                        .toList(),
                  ),
                  Text(
                    widget.id.description.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.id.price.toString()} \$',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: widget.id.rating!.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
