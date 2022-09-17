import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_details_screen.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                    product: product,
                                  )),
                        );
                      },
                      child: Image.network(product.images[0]),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 8,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      'Preço: R\$${product.price}',
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: const Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
