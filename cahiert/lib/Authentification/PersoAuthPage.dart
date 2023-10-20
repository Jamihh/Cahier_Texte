import 'package:flutter/material.dart';

import '../HomePage/PersoHomePage.dart';

class PersoAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification Personnel administratif'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.supervisor_account,
              size: 60,
              color: Colors.blue, // Couleur de l'icône
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenue, Personnel administratif',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                  prefixIcon: Icon(
                      Icons.person), // Icône pour le champ de nom d'utilisateur
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                obscureText: true, // Pour masquer le mot de passe
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon:
                      Icon(Icons.lock), // Icône pour le champ de mot de passe
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gérez l'authentification ici
                // Une fois l'authentification réussie, vous pouvez rediriger l'utilisateur
                // vers la page PersonnelHomePage.dart en utilisant Navigator.

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersoHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Se Connecter',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
