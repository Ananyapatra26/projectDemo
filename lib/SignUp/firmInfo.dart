import 'package:demoproject/SignUp/verificationPage.dart';
import 'package:flutter/material.dart';

class Farminfo extends StatefulWidget {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String reEnterPassword;

  const Farminfo({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.reEnterPassword,
  });

  @override
  State<Farminfo> createState() => _FarminfoState();
}

class _FarminfoState extends State<Farminfo> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _informalNameController = TextEditingController();
  final TextEditingController _streetAddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();

  String? _selectedState;

  @override
  void dispose() {
    _businessNameController.dispose();
    _informalNameController.dispose();
    _streetAddressController.dispose();
    _cityController.dispose();
    _zipcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("...........${widget.fullName}................");
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
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
                _buildTextField(
                  controller: _businessNameController,
                  labelText: "Business Name",
                  icon: Icons.business,
                ),
                SizedBox(height: deviceHeight * 0.02),
                _buildTextField(
                  controller: _informalNameController,
                  labelText: "Informal Name",
                  icon: Icons.emoji_emotions,
                ),
                SizedBox(height: deviceHeight * 0.02),
                _buildTextField(
                  controller: _streetAddressController,
                  labelText: "Street Address",
                  icon: Icons.home,
                ),
                SizedBox(height: deviceHeight * 0.02),
                _buildTextField(
                  controller: _cityController,
                  labelText: "City",
                  icon: Icons.location_on,
                ),
                SizedBox(height: deviceHeight * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown(),
                    ),
                    SizedBox(width: 10), // Add some spacing between the widgets
                    Expanded(
                      child: _buildTextField(
                        controller: _zipcodeController,
                        labelText: "Enter Zipcode",
                        icon: Icons.pin,
                      ),
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
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationPage(
                                fullName: widget.fullName,
                                email: widget.email,
                                phone: widget.phone,
                                password: widget.password,
                                reEnterPassword: widget.reEnterPassword,
                                businessName: _businessNameController.text,
                                informalName: _informalNameController.text,
                                streetAddress: _streetAddressController.text,
                                city: _cityController.text,
                                state: _selectedState.toString(),
                                zipcode: _zipcodeController.text,
                              ),
                            ),
                          );
                        }
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
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
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
      value: _selectedState,
      items: ['New York', 'Dubai', 'Singapore']
          .map((label) => DropdownMenuItem(
        child: Text(label),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedState = value;
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
}
