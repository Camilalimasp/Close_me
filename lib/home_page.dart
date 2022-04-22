import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:split_view/split_view.dart';

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
      body: SplitView(
        viewMode: SplitViewMode.Vertical,
        indicator: SplitIndicator(viewMode: SplitViewMode.Vertical),
        activeIndicator: SplitIndicator(
          viewMode: SplitViewMode.Vertical,
          isActive: true,
        ),
        children: [
          Container(
            color: Colors.pink[50],
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                color: Colors.pink[50],
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.library_add_check_outlined,
                              color: Colors.black, size: 50)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.library_add_check_outlined,
                              color: Colors.black, size: 50)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.library_add_check_outlined,
                              color: Colors.black, size: 50)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.library_add_check_outlined,
                              color: Colors.black, size: 50)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.library_add_check_outlined,
                              color: Colors.black, size: 50)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.pink[50],
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
                          image: AssetImage("assets/principal.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.1),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      height: 200,
                      width: 150,
                    ),
                    Text("Conjunto Pandora"),
                    Text("P, M, G, EX"),
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
                      height: 200,
                      width: 150,
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
                      height: 200,
                      width: 150,
                    ),
                    Text("Body Letícia"),
                    Text("P, G"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
