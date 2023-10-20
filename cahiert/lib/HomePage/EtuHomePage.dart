import 'package:cahiert/Etudiant/voirCahier.dart';
import 'package:cahiert/Etudiant/voirPresence.dart';
import 'package:cahiert/WelcomePage.dart';
import 'package:flutter/material.dart';

class EtuHomePage extends StatefulWidget {
  const EtuHomePage({Key? key}) : super(key: key);

  @override
  _EtuHomePageState createState() => _EtuHomePageState();
}

class _EtuHomePageState extends State<EtuHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EasyClassNotes"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 78, 160, 254).withOpacity(0.9),
                    const Color.fromARGB(255, 78, 160, 254),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              accountName: const Text(
                  "Etudiant"), // Remplacez par le nom de l'utilisateur
              accountEmail: const Text(
                  "Etu@gmail.com"), // Remplacez par le prénom de l'utilisateur
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 78, 160, 254),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ), // Icône pour la liste des patients
              title: const Text('Accueil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EtuHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.format_list_numbered_sharp,
              ), // Icône pour créer un dossier patient
              title: const Text('Voir mes présences'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoirPresence(
                      totalPresences: 6,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.menu_book_sharp,
              ), // Icône pour créer un dossier patient
              title: const Text('Voir cahier'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoirCahier(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ), // Icône pour le planning du médecin
              title: const Text('Se déconnecter'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRect(
                    child: Image.asset(
                      'assets/images/etuu.png',
                      height: 220,
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bonjour, étudiant !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionCard(
                    context,
                    'Voir le cahier de texte',
                    Icons.book,
                    Color.fromARGB(255, 63, 159, 255),
                    () {
                      _showHomework(context);
                    },
                  ),
                  _buildActionCard(
                    context,
                    'Voir mes présences',
                    Icons.calendar_today,
                    Color.fromARGB(255, 63, 159, 255),
                    () {
                      _showAttendanceCalendar(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/welcomepage');
  }

  Widget _buildActionCard(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),
              SizedBox(height: 8.0),
              Text(
                label,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showHomework(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              VoirCahier()), // Remplacez VoirCahierPage par le nom réel de votre classe Dart
    );
  }

  void _showAttendanceCalendar(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => VoirPresence(
                totalPresences: 6,
              )), // Remplacez VoirPresencePage par le nom réel de votre classe Dart
    );
  }

  void _handleMenuItemClick(int value) {
    switch (value) {
      case 1:
        // Accueil
        break;
      case 2:
        // Cahier de texte
        _showHomework(context);
        break;
      case 3:
        // Présences
        _showAttendanceCalendar(context);
        break;
      case 4:
        // Profil
        break;
      case 5:
        // Déconnexion
        _logout(context);
        break;
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: EtuHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
