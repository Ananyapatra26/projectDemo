import 'package:flutter/material.dart';

class BusinessHours extends StatefulWidget {
  const BusinessHours({super.key});

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
            SizedBox(height: deviceHeight*0.03),
            Text(
              "Signup 4 of 4",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: deviceHeight*0.03),
            Text(
              "Business Hours",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: deviceHeight*0.03),
            Text(
              "Choose the hours your farm is open for pickups.\nThis will allow customers to order deliveries.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: deviceHeight*0.03),
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
            SizedBox(height: deviceHeight*0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: deviceHeight*0.03),
                _timeSlot("8:00am - 10:00am", isSelected: true),
                SizedBox(height: deviceHeight*0.03),
                _timeSlot("10:00am - 1:00pm", isSelected: true),
              ],
            ),
            SizedBox(height: deviceHeight*0.01,width:deviceWidth *0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: deviceHeight*0.03),
                _timeSlot("1:00pm - 4:00pm"),
                SizedBox(height: deviceHeight*0.03),
                _timeSlot("4:00pm - 7:00pm"),
              ],
            ),
            SizedBox(height: deviceHeight*0.01 ),
            _timeSlot("7:00pm - 10:00pm"),
            Spacer(),
            Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.black),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    // Handle signup action
                  },
                  child: Text("Signup"),
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
}
