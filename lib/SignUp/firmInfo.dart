
import 'package:demoproject/SignUp/verificationPage.dart';
import 'package:flutter/material.dart';
class Farminfo extends StatefulWidget {
  const Farminfo({super.key});

  @override
  State<Farminfo> createState() => _FarminfoState();
}

class _FarminfoState extends State<Farminfo> {
  String? selectedValue;
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
                "Signup 2 of 4",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: deviceHeight * 0.02),
              const Text(
                "Farm Info",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(height: 20),

              SizedBox(height: deviceHeight * 0.05),
              _buildTextField(labelText: "Business Name", icon: Icons.business),
              SizedBox(height: deviceHeight * 0.02),
              _buildTextField(labelText: "Informal Name", icon: Icons.emoji_emotions),
              SizedBox(height: deviceHeight * 0.02),
              _buildTextField(labelText: "Street Addrees", icon: Icons.home),
              SizedBox(height: deviceHeight * 0.02),
              _buildTextField(labelText: "City", icon: Icons.location_on),
              SizedBox(height: deviceHeight * 0.02),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown(),
                  ),
                  SizedBox(width: 10), // Add some spacing between the widgets
                  Expanded(
                    child: _buildTextField(labelText: "Enter Zipcode", icon: Icons.pin),
                  ),
                ],
              ),


              SizedBox(height: deviceHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationPage()));
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

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: ['Option 1', 'Option 2', 'Option 3']
          .map((label) => DropdownMenuItem(
        child: Text(label),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
      decoration: InputDecoration(
        labelText: "State",
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
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: GestureDetector(
        onTap: () {
          // Handle image tap if needed
        },
        child: Image.asset(
          assetPath,
          width: 50, // Set desired width
          height: 50, // Set desired height
        ),
      ),
    );
  }
}
