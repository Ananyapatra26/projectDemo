import 'package:flutter/material.dart';

import 'SingIn/signIn.dart';




class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                OnboardingPage(
                  image: 'assets/greenhome-removebg-preview.png',
                  title: 'Quality',
                  description:
                  'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
                  buttonColor: Color(0xFF6DBE45),
                ),
                OnboardingPage(
                  image: 'assets/orangeiamge.png',
                  title: 'Convenient',
                  description:
                  'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
                  buttonColor: Color(0xFFE4644C),
                ),
                OnboardingPage(
                  image: 'assets/yellowimage.png',
                  title: 'Local',
                  description:
                  'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
                  buttonColor: Color(0xFFF3AE44),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: _currentPage == index ? 24.0 : 8.0,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              );
            }),
          ),
          SizedBox(height: deviceHeight * 0.05),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final Color buttonColor;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonColor,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Top Image
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Container over Image
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.09),
                  // Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                    ),
                    onPressed: () {


                    },
                    child: Text('Join the movement!',style: TextStyle(color: Colors.white),),
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to LoginScreen
                        );
                      },
                      child: Text("Login")),

                  SizedBox(height: deviceHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
