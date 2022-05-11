import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ManualLoader extends StatelessWidget {
  const ManualLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(),
        child: Lottie.asset(
          "assets/covid_loader.json",
          width: double.infinity,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
