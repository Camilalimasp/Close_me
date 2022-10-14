import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/user.dart';
import 'product_details_screen.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  final User user;
  const SearchedProduct({
    Key? key,
    required this.product,
    required this.user,
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
                        if (product.quantity > 0)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                      product: product,
                                      user: user,
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
                  if (product.quantity > 0)
                    Container(
                      width: 100,
                      child: const Text(
                        'Em estoque',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  if (product.quantity == 0)
                    Container(
                      width: 100,
                      child: const Text(
                        'Indisponível',
                        style: TextStyle(
                          color: Colors.red,
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
