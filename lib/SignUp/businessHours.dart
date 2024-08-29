import 'dart:convert';

import 'package:demoproject/SignUp/signUpModelClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../urls.dart';

class BusinessHours extends StatefulWidget {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String reEnterPassword;
  final String businessName;
  final String informalName;
  final String streetAddress;
  final String city;
  final String state;
  final String zipcode;
  final String pdfFilePath;
  const BusinessHours(
      {required this.fullName,
      required this.email,
      required this.phone,
      required this.password,
      required this.reEnterPassword,
      required this.businessName,
      required this.informalName,
      required this.streetAddress,
     required this.city,
      required this.state,
      required this.zipcode,
      required this.pdfFilePath});

  @override
  State<BusinessHours> createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FarmerEats",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: deviceHeight * 0.03),
            Text(
              "Signup 4 of 4",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: deviceHeight * 0.03),
            Text(
              "Business Hours",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: deviceHeight * 0.03),
            Text(
              "Choose the hours your farm is open for pickups.\nThis will allow customers to order deliveries.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: deviceHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dayButton('M'),
                _dayButton('T'),
                _dayButton('W', isSelected: true),
                _dayButton('Th'),
                _dayButton('F'),
                _dayButton('S'),
                _dayButton('Su'),
              ],
            ),
            SizedBox(height: deviceHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: deviceHeight * 0.03),
                _timeSlot("8:00am - 10:00am", isSelected: true),
                SizedBox(height: deviceHeight * 0.03),
                _timeSlot("10:00am - 1:00pm", isSelected: true),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.01,
              width: deviceWidth * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: deviceHeight * 0.03),
                _timeSlot("1:00pm - 4:00pm"),
                SizedBox(height: deviceHeight * 0.03),
                _timeSlot("4:00pm - 7:00pm"),
              ],
            ),
            SizedBox(height: deviceHeight * 0.01),
            _timeSlot("7:00pm - 10:00pm"),
            Spacer(),
            Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.black),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  ),
                  onPressed: () {
                    registerUser();
                  },
                  child: Text("Signup",style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dayButton(String day, {bool isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.shade300 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: Text(
        day,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _timeSlot(String time, {bool isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.shade300 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        time,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  bool isLoading = false;
 /* Future<void> Signups(BuildContext context) async {
    isLoading = true;
    try {
      final response = await http.post(
        Uri.parse(signUp),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          SignUpModelClass(
         fullName:widget.fullName,
           email:widget.email,
           phone: widget.phone,
         password: widget.password,
        role:"Manager",
          businessName:widget.businessName,
           informalName: widget.informalName,
          address: widget.streetAddress,
           city: widget.city,
           state: widget.state,
           zipCode: int.parse(widget.zipcode),
           registrationProof: widget.pdfFilePath,
          ),
        ),
      );

      if (response.statusCode == 200) {
        // Show success Flushbar or similar
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Bhakta_SignIn()),
        // );
      } else if (response.statusCode == 202) {
        print('Signup Accepted: Pending further processing.');
      } else {
        // Handle other status codes or error responses
        print('Signup Failed: Unexpected response ${response.statusCode}');
      }
    } catch (e) {
      print('Signup Failed: $e');
    } finally {
      isLoading = false;

    }
  }*/

  Future<void> registerUser() async {
    final Map<String, dynamic> userData = {
      "full_name": widget.fullName,
      "email": widget.email,
      "phone": widget.phone,
      "password": widget.password,
      "role": "Manager",
      "business_name": widget.businessName,
      "informal_name": widget.informalName,
      "address": widget.streetAddress,
      "city": widget.city,
      "state": widget.state,
      "zip_code": int.parse(widget.zipcode),
      "registration_proof": widget.pdfFilePath,
      "business_hours": {
        "mon": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "tue": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "wed": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
        "thu": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
        "fri": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "sat": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "sun": ["8:00am - 10:00am"],
      },
      "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      "type": "email/facebook/google/apple",
      "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
    };

    try {
      final response = await http.post(
        Uri.parse(signUp),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userData),
      );

      /// Handling the response
      if (response.statusCode == 200) {
        print("User registered successfully: ${response.body}");
      } else {
        print("Failed to register user: ${response.body}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
}
