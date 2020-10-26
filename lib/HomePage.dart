import 'dart:io';

import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.network('https://assets1.lottiefiles.com/private_files/lf30_LOw4AL.json', width: Platform.isAndroid ? 400: 60),
            //Text("Get Started"),

          ],
        ),
        
        
      ),
      bottomSheet: Container (
      color: Colors.deepPurple,
        height: Platform.isAndroid ? 50 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Text('RETRY',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                )
                ),
                onTap: () {
                  // Navigate to second route when tapped.
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Text('LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800
                    )
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
      ),
    ),
    );
  }

}