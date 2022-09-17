import 'package:flutter/material.dart';
import '../common/widgets/custom_button.dart';
import '../common/widgets/custom_textfield.dart';
import '../constants/global_variables.dart';
import '../models/product.dart';
import '../services/auth_service.dart';
import '../util/myappbar.dart';

enum Auth {
  signin,
  signup,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Product>? products;
  Auth auth = Auth.signup;
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            tileColor: auth == Auth.signup
                ? GlobalVariables.backgroundColor
                : GlobalVariables.greyBackgroundCOlor,
            title: const Text(
              'Create Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              activeColor: GlobalVariables.secondaryColor,
              value: Auth.signup,
              groupValue: auth,
              onChanged: (Auth? val) {
                setState(() {
                  auth = val!;
                });
              },
            ),
          ),
          if (auth == Auth.signup)
            Container(
              padding: const EdgeInsets.all(8),
              color: GlobalVariables.backgroundColor,
              child: Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (signUpFormKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ListTile(
            tileColor: auth == Auth.signin
                ? GlobalVariables.backgroundColor
                : GlobalVariables.greyBackgroundCOlor,
            title: const Text(
              'Sign-In.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              activeColor: GlobalVariables.secondaryColor,
              value: Auth.signin,
              groupValue: auth,
              onChanged: (Auth? val) {
                setState(() {
                  auth = val!;
                });
              },
            ),
          ),
          if (auth == Auth.signin)
            Container(
              padding: const EdgeInsets.all(8),
              color: GlobalVariables.backgroundColor,
              child: Form(
                key: signInFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Sign In',
                      onTap: () {
                        if (signInFormKey.currentState!.validate()) {
                          signInUser();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
      backgroundColor: Colors.pink[50],
    );
  }
}
