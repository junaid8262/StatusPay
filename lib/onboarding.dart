import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:status_pay_app/Model/SliderModel.dart';
import 'package:status_pay_app/forgot_password.dart';
import 'package:status_pay_app/login.dart';
import 'package:status_pay_app/otp.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // creating all the widget before making our home screen

  int _currentPage = 0;
  List<SliderModel> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      SliderModel("assets/images/icon.png", "Sign Up and Start Earning."),
      SliderModel(
          "assets/images/icon.png", "Download and Upload the Advert on your WhatsApp Status."),
      SliderModel("assets/images/icon.png", "Submit the Screenshots After 20 Hours."),
      SliderModel("assets/images/icon.png", "Receive Credit to your StatusPay Account."),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  // building single slide

  Widget _buildSlide(SliderModel slide) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: Container(
            //margin: EdgeInsets.all(12),
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            slide.heading,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        FloatingActionButton(
            child: const Icon(Icons.arrow_forward_ios_outlined),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            onPressed: () => {
              navigationPage()
            }),
        SizedBox(
          height: 100,
        )
      ],
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 16,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 20 : 15,
      height: index == _currentPage ? 20 : 15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Color.fromRGBO(76, 174, 227, 1)
              : Color.fromRGBO(206, 209, 223, 1)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                //_buildPageIndicator(),
                SizedBox(
                  height: 32,
                ),
                Container(
                  // see the page indicators
                  margin: EdgeInsets.symmetric(horizontal: 32),
                ),
                _buildPageIndicator(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}