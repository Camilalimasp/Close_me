// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../bottombar.dart';
import '../constants/utils.dart';
import '../models/order.dart';
import '../services/search_services.dart';
import 'order_details.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await searchServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null || orders!.length == 0
        ? const BottomBar()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Suas compras',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'Veja tudo',
                      style: TextStyle(
                        color: Utils.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetailScreen.routeName,
                          arguments: orders![index],
                        );
                      },
                      child: SingleProduct(
                        image: orders![index].products[0].images[0],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

SingleProduct({required String image}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(10),
        child: Image.network(
          image,
          fit: BoxFit.fitHeight,
          width: 180,
        ),
      ),
    ),
  );
}
