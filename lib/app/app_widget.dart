import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Autenticador.dart';
import '../services/auth_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.black38, Colors.black87],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
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
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Center(
                child: Text("Close.me Lingerie"),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Autenticador()),
                        );
                      },
                      child: const Text("Home"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple, onPrimary: Colors.white),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
