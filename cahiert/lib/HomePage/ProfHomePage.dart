import 'package:cahiert/Prof/CahierTexte.dart';
import 'package:cahiert/Prof/CreerSeance.dart';
import 'package:cahiert/Prof/ListePresence.dart';
import 'package:cahiert/Prof/Seance.dart';
import 'package:flutter/material.dart';

class ProfHomePage extends StatefulWidget {
  const ProfHomePage({Key? key}) : super(key: key);

  @override
  _ProfHomePageState createState() => _ProfHomePageState();
}

class _ProfHomePageState extends State<ProfHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EasyClassNotes"),
      ),
      backgroundColor: Colors.white,
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
                  "Professeur"), // Remplacez par le nom de l'utilisateur
              accountEmail: const Text(
                  "prof@gmail.com"), // Remplacez par le prénom de l'utilisateur
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
                    builder: (context) => const ProfHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.menu_book,
              ), // Icône pour créer un dossier patient
              title: const Text('Séance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreerSeance(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book,
              ), // Icône pour créer un dossier patient
              title: const Text('Cahier de texte'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CahierTextePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.list_alt_rounded,
              ), // Icône pour créer un dossier patient
              title: const Text('Liste présence'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListePresence(),
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
                    builder: (context) => ProfHomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/br.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Bonjour Professeur !",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildGridCard(
                  context,
                  'Séance',
                  Icons.book,
                  Seance(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard(
      BuildContext context, String label, IconData icon, Widget route) {
    return Align(
      alignment:
          Alignment(3.5, 0), // Déplacer vers la gauche // Pour pousser à gauche
      child: Container(
        width: 150.0,
        height: 150.0,
        child: Card(
          elevation: 5, // Ajouter une ombre
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Ajouter une bordure arrondie
            side: BorderSide(
                color: const Color.fromARGB(0, 66, 66, 66),
                width: 2.0), // Couleur de la bordure
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            splashColor: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40.0,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10.0),
                Text(
                  label,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/welcomepage');
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Menu Professeur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
              // Ajoutez l'action à effectuer lorsque l'utilisateur tape sur "Accueil"
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Cahier de texte'),
            onTap: () {
              Navigator.pop(context);
              _showCahierTexte(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text('Présences'),
            onTap: () {
              Navigator.pop(context);
              _showListePresence(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.pop(context);
              // Ajoutez l'action à effectuer lorsque l'utilisateur tape sur "Profil"
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () {
              Navigator.pop(context);
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  void _showCahierTexte(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CahierTextePage()),
    );
  }

  void _showListePresence(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListePresence()),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
