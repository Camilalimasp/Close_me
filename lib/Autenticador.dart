import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

class Autenticador extends StatefulWidget {
  const Autenticador({Key? key}) : super(key: key);

  @override
  State<Autenticador> createState() => _AutenticadorState();
}

class _AutenticadorState extends State<Autenticador> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    /*ChatPage(),
    FeedPage(),
    ProfilePage()*/
    //Center(child: Text('Home', style: TextStyle(fontSize: 60))),
    Center(child: Text('Feed', style: TextStyle(fontSize: 60))),
    Center(child: Text('Chat', style: TextStyle(fontSize: 60))),
    Center(child: Text('Carrinho', style: TextStyle(fontSize: 60))),
    LoginScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          iconSize: 40,
          //selectedFontSize: 25,
          //unselectedFontSize: 16,

          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              label: 'Feed',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check_outlined),
              label: 'Chat',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
