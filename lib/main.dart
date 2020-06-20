import 'package:flutter/material.dart';

// Routes
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Rubik',
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://i.pinimg.com/474x/8c/93/d3/8c93d35df867bf1e169cbd2c4718b1f2--cookbook-photography-ingredient-photography.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Text(
                'fudi',
                style: TextStyle(
                  fontFamily: 'Organo',
                  color: Colors.indigo,
                  fontWeight: FontWeight.w900,
                  fontSize: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
