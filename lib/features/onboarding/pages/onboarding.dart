import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();


  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: ,
        )
        
        ],
      ),
    );
  }
}
