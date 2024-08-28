import 'package:flutter/material.dart';
import 'firmInfo.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedValue; // Holds the selected value for the dropdown

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceHeight * 0.14),
              const Text(
                "Signup 1 of 4",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: deviceHeight * 0.02),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialMediaIcon('assets/google-removebg-preview.png'),
                  _buildSocialMediaIcon('assets/applelogo-removebg-preview.png'),
                  _buildSocialMediaIcon('assets/fb-removebg-preview.png'),
                ],
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "or signup with",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: deviceHeight * 0.05),
              _buildTextField(labelText: "Full Name", icon: Icons.person),
              SizedBox(height: deviceHeight * 0.02),
              _buildTextField(labelText: "Email Address", icon: Icons.email),
              SizedBox(height: deviceHeight * 0.02),

              _buildTextField(labelText: "Phone Number", icon: Icons.phone),
              SizedBox(height: deviceHeight * 0.02),

              _buildTextField(labelText: "Password", icon: Icons.lock),
              SizedBox(height: deviceHeight * 0.02),

              _buildTextField(labelText: "Re-enter Password", icon: Icons.lock),
              SizedBox(height: deviceHeight * 0.02),
              // Add dropdown here
              SizedBox(height: deviceHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Farminfo()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade600,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String labelText, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }



  Widget _buildSocialMediaIcon(String assetPath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: GestureDetector(
        onTap: () {

        },
        child: Image.asset(
          assetPath,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
