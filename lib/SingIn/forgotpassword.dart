
import 'package:demoproject/SingIn/varifyOtp.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: deviceHeight * 0.25),
            Text(
              "Forgot Password?",
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
                  "Remember Your Password?",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5.0),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: deviceHeight * 0.08),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: "Phone Number",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange.shade600,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                "Send Code",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
