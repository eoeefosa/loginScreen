import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/checkout1.dart';

import 'profile_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<FirebaseApp> _initalizefirebase() async {
    FirebaseApp app = await Firebase.initializeApp();
    return app;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initalizefirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Login function
  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No user found for that email');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // create the textfield controller
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MyApp Title',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Login to your App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          TextField(
            controller: _emailcontroller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "user Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordcontroller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'User Password',
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Don't remember your Password",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(
            height: 88.0,
          ),
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                User? user = await loginUsingEmailPassword(email: _emailcontroller.text, password: _passwordcontroller.text, context: context);
                print(user);
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CheckoutOnePage()));
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
