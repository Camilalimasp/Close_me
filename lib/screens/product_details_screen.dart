import 'package:carousel_slider/carousel_slider.dart';
import 'package:close_me/screens/cart_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../common/widgets/custom_button.dart';
import '../models/product.dart';
import '../models/user.dart';
import '../services/product_details_services.dart';
import '../util/myappbar.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  final User user;

  const ProductDetailScreen({
    Key? key,
    required this.product,
    required this.user,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  @override
  void initState() {
    super.initState();
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  void goToCart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              color: Colors.white,
              height: 5,
            ),
            Container(
              child: Column(children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: ' ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'R\$${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(240, 0, 0, 0),
                    child: FavoriteButton(
                      isFavorite: false,
                      // iconDisabledColor: Colors.white,
                      valueChanged: (_isFavorite) {},
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.white,
              height: 5,
            ),
            Card(
                child: Column(
              children: [
                Icon(Icons.account_circle_outlined),
                Text(widget.user.name != "" ? widget.user.name : ""),
                Text(widget.user.email != "" ? widget.user.email : ""),
              ],
            )),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: 'Visualizar Carrinho',
                onTap: goToCart,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: '+ Adicionar ao Carrinho',
                onTap: addToCart,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
