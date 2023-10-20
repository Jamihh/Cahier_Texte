import 'package:flutter/material.dart';
import 'package:cahiert/Admin/Etudiant.dart';
import 'package:cahiert/Admin/Professeur.dart';
import 'package:cahiert/Admin/Responsable.dart';

class creerPage extends StatelessWidget {
  final List<String> userTypes = ['Responsables', 'Professeurs', 'Etudiants'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer comptes'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Image en bas de l'app bar
          Image(
            image: AssetImage('assets/images/cr.png'),
            width: 350,
            height: 300,
            fit: BoxFit.cover,
          ),
          // Cartes des utilisateurs
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: userTypes.map((userType) {
                  return buildUserCard(userType, () {
                    // Action de redirection ici
                    switch (userType) {
                      case 'Responsables':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Responsable(),
                          ),
                        );
                        break;
                      case 'Professeurs':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Professeur(),
                          ),
                        );
                        break;
                      case 'Etudiants':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Etudiant(),
                          ),
                        );
                        break;
                    }
                  });
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserCard(String userType, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 100.0, // Ajustez la largeur de la carte selon vos besoins
          height: 100.0,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 40.0, color: Colors.blue),
              SizedBox(height: 8.0),
              Text(
                userType,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: creerPage(),
    debugShowCheckedModeBanner: false,
  ));
}
