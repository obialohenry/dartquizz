import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //An Icon//
                  Row(
                    children: [
                      //An Icon//
                    ],
                  ),
                ],
              ),
              Container()
          ],
        ),
      ),),
    );
  }
}