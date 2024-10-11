import 'package:circular_list/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    DineRigh(),
  );
}

class DineRigh extends StatelessWidget {
  const DineRigh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
