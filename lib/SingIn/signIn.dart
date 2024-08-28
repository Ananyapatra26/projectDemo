import 'package:flutter/material.dart';

import '../SignUp/signUp.dart';
import 'forgotpassword.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  "New here?",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                  child: Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email Address",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Password",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                  },
                  child: Text(
                    "Forgot?",
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange.shade600,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(
                  child: Text(
                    "or login with",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20.0),
            // Row of containers with images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Image Container
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Handle image tap if needed
                    },
                    child: Image.asset(
                      'assets/google-removebg-preview.png',
                      width: 50, // Set desired width
                      height: 50, // Set desired height
                    ),
                  ),
                ),
                // Apple Image Container
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Handle image tap if needed
                    },
                    child: Image.asset(
                      'assets/applelogo-removebg-preview.png',
                      width: 50, // Set desired width
                      height: 50, // Set desired height
                    ),
                  ),
                ),
                // Facebook Image Container
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Handle image tap if needed
                    },
                    child: Image.asset(
                      'assets/fb-removebg-preview.png',
                      width: 50, // Set desired width
                      height: 50, // Set desired height
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
