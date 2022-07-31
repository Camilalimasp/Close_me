import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
//import 'package:split_view/split_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.black,
    size: 28,
  );
  Widget customSearchBar = const Text('   ');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customSearchBar,
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: '                  ',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                          border: InputBorder.none),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 28,
                  );
                  customSearchBar = const Text('   ');
                }
              });
            },
            icon: customIcon,
            color: Colors.black,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined,
                  color: Colors.black, size: 28)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.email_outlined, color: Colors.black, size: 28)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, color: Colors.black, size: 28)),
        ],
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Colors.pink[50],
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(Icons.library_add_check_outlined,
                                    color: Colors.black, size: 50),
                                Icon(Icons.library_add_check_outlined,
                                    color: Colors.black, size: 50),
                                Icon(Icons.library_add_check_outlined,
                                    color: Colors.black, size: 50),
                                Icon(Icons.library_add_check_outlined,
                                    color: Colors.black, size: 50),
                                Icon(Icons.library_add_check_outlined,
                                    color: Color.fromRGBO(0, 0, 0, 1), size: 50)
                              ],
                            ),
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
                                        'assets/3_aranhas.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/aranha_coffe.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/aranha1.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/espetacular.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/spider_game.jpg',
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
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        /* Item 1 */
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage("assets/principal.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.1),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            height: 125,
                            width: 100,
                          ),
                          const Text("Conjunto Pandora"),
                          const Text("P, M, G, EX"),
                        ],
                      ),
                      Column(
                        /* Item 2 */
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/principal.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.1),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            height: 125,
                            width: 100,
                          ),
                          Text("Calcinha Tifany"),
                          Text("G, EX"),
                        ],
                      ),
                      Column(
                        /* Item 3 */
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/principal.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.1),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            height: 125,
                            width: 100,
                          ),
                          Text("Body Letícia"),
                          Text("P, G"),
                        ],
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
