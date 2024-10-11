import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  LinearGradient linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff15293A),
        Color(0xff224767),
      ]);

  late AnimationController _controller;
  late Animation<double> _animation;
  double rotationAngle = 0.0; // Keeps track of the current rotation angle

  int noOfCirles = 4;

// Keeps track of the current rotation angle

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1), // Duration for the 45-degree rotation
      vsync: this,
    );

    // Define the animation with an ease-out curve
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    // Start the rotation cycle
    _startRotation();
  }

  Future<void> _startRotation() async {
    while (true) {
      await _controller.forward(); // Animate from 0 to 1 with the easeOut curve
      _controller.reset(); // Reset the controller

      setState(() {
        // Update the rotation angle by 45 degrees (in radians)
        rotationAngle += 2 * pi / noOfCirles;
      });

      // Pause for 2 seconds
      await Future.delayed(Duration(seconds: 2));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: linearGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -453,
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    double currentRotation = rotationAngle +
                        (_animation.value * (2 * pi / noOfCirles));
                    return Transform.rotate(
                      angle: currentRotation,
                      child: Image.asset(
                        'assets/images/a.png',
                        width: 901,
                        height: 883,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
