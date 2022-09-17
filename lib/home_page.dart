import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'common/widgets/loader.dart';
import 'models/product.dart';
import 'screens/searched_product.dart';
import 'services/search_services.dart';
import 'util/myappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchAllProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Column(
            children: [
              Container(
                color: Colors.pink[50],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 35, 15, 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.library_add_check_outlined,
                            color: Colors.black, size: 50),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.library_add_check_outlined,
                            color: Colors.black, size: 50),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.library_add_check_outlined,
                            color: Colors.black, size: 50),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.library_add_check_outlined,
                            color: Colors.black, size: 50),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.library_add_check_outlined,
                            color: Colors.black, size: 50),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Colors.pink[50],
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 40, 15, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: ImageSlideshow(
                                    /// Width of the [ImageSlideshow].
                                    width: 290,

                                    /// Height of the [ImageSlideshow].
                                    height: 180,

                                    /// The page to show when first creating the [ImageSlideshow].
                                    initialPage: 0,

                                    /// The color to paint the indicator.
                                    indicatorColor: Colors.blue,

                                    /// The color to paint behind th indicator.
                                    indicatorBackgroundColor: Colors.grey,

                                    /// Called whenever the page in the center of the viewport changes.
                                    onPageChanged: (value) {
                                      Text('Page changed: $value');
                                    },

                                    /// Auto scroll interval.
                                    /// Do not auto scroll with null or 0.
                                    autoPlayInterval: 3000,

                                    /// Loops back to first slide.
                                    isLoop: true,

                                    /// The widgets to display in the [ImageSlideshow].
                                    /// Add the sample image file into the images folder
                                    children: [
                                      Image.asset(
                                        'assets/sexy-brunette-in-lingerie.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/underwear-kitchen.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/underwear-on-gray.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/beautiful-woman-body-in-lingerie.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.pink[50],
                width: constraints.maxHeight,
                height: 255,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: products == null
                      ? const Loader()
                      : Column(
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              height: 200,
                              width: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products!.length,
                                itemBuilder: (context, index) {
                                  return SearchedProduct(
                                    product: products![index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                color: Colors.pink[50],
              ),
            ],
          ),
        );
      }),
    );
  }
}
