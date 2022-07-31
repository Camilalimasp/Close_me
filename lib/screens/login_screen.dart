import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth_buttons/auth_buttons.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _HomePage();
}

class _HomePage extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Icon customIcon = const Icon(
      Icons.search,
      color: Colors.black,
      size: 28,
    );
    Widget customSearchBar = const Text('   ');

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
          ),
          FacebookAuthButton(
            onPressed: () {},
            style: AuthButtonStyle(),
          ),
          GoogleAuthButton(
            onPressed: () {
              // your implementation
              //setState(() {
              //});
            },
            style: AuthButtonStyle(),
          ),
          EmailAuthButton(
            onPressed: () {
              authService.signInWithEmailAndPassword(
                  emailController.text, passwordController.text);
            },
            style: AuthButtonStyle(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register')),
        ],
      ),
      backgroundColor: Colors.pink[50],
    );
  }
}
