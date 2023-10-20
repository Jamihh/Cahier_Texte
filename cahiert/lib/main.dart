import 'package:cahiert/HomePage/AdminHomePage.dart';
import 'package:cahiert/HomePage/EtuHomePage.dart';
import 'package:cahiert/HomePage/PersoHomePage.dart';
import 'package:cahiert/HomePage/ProfHomePage.dart';
import 'package:cahiert/WelcomePage.dart';
//import 'package:cahiert/redirection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/adminhomepage': (context) => AdminHomePage(),
        '/profhomepage': (context) => ProfHomePage(),
        '/persohomepage': (context) => PersoHomePage(),
        '/etuhomepage': (context) => EtuHomePage(),
      },
      title: 'EASYCLASSNOTES',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white, // Couleur de fond blanche
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/web.png', // Remplacez par le chemin correct de votre logo.
              width: 350, // Ajustez la largeur de l'image selon vos besoins.
              height: 350, // Ajustez la hauteur de l'image selon vos besoins.
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenue dans EasyClassNotes !',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Naviguez vers la page principale (main.dart) ou toute autre page souhaitée.
                Navigator.of(context).pushNamed('/welcome');
              },
              child: Text(
                'Commencer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
