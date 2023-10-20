import 'package:cahiert/Admin/Classes.dart';
import 'package:cahiert/Admin/VoirCahiert.dart';
import 'package:cahiert/Admin/dashboard.dart';
import 'package:cahiert/ClassHome.dart';
import 'package:cahiert/CoursHome.dart';
import 'package:cahiert/FiliereHome.dart';
import 'package:cahiert/ListeC.dart';
//import 'package:cahiert/Responsable/ListeClasse.dart';
import 'package:cahiert/WelcomePage.dart';
//import 'package:cahiert/creerPage.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 78, 160, 254).withOpacity(0.8),
        title: const Text('Accueil Admin'),
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
              accountName:
                  const Text("Admin"), // Remplacez par le nom de l'utilisateur
              accountEmail: const Text(
                  "admin@gmail.com"), // Remplacez par le prénom de l'utilisateur
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 78, 160, 254),
                ),
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.home), // Icône pour la liste des patients
              title: const Text('Accueil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons
                  .dashboard_rounded), // Icône pour créer un dossier patient
              title: const Text('Tableau de bord'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => dashboard(),
                  ),
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.logout), // Icône pour le planning du médecin
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
      body: Material(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/cahier.png',
                    width: 160,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Bonjour admin !",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: [
                    _construireElementMenu(
                      name: 'Comptes',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListeC(),
                          ),
                        );
                      },
                    ),
                    _construireElementMenu(
                      name: 'Filières',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FiliereHome(),
                          ),
                        );
                      },
                    ),
                    _construireElementMenu(
                      name: 'Classes',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ClassHome(),
                          ),
                        );
                      },
                    ),
                    _construireElementMenu(
                      name: 'Cours',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CoursHome(),
                          ),
                        );
                      },
                    ),
                    _construireElementMenu(
                      name: 'Cahier de texte',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VoirCahier(),
                          ),
                        );
                      },
                    ),
                    _construireElementMenu(
                      name: 'Liste présences',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Classes(
                              filiere: '',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construireElementMenu({
    required String name,
    required VoidCallback action,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: action,
        splashColor: const Color.fromARGB(255, 78, 160, 254),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                getIconForName(name),
                size: 30.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                name,
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.calendar_today,
        size: 24,
        color: Colors.white,
      ),
      onSelected: (value) {
        if (value == 'deconnexion') {
          _deconnexion(context);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'deconnexion',
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: Colors.black54,
                ),
                const SizedBox(width: 10),
                Text('Se déconnecter'),
              ],
            ),
          ),
        ];
      },
    );
  }

  void _deconnexion(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/welcomepage');
  }

  IconData getIconForName(String name) {
    switch (name) {
      case 'Comptes':
        return Icons.supervisor_account;
      case 'Filières':
        return Icons.school;
      case 'Classes':
        return Icons.apartment;
      case 'Cours':
        return Icons.library_books;
      case 'Cahier de texte':
        return Icons.book;
      case 'Liste présences':
        return Icons.event_note;
      default:
        return Icons.error;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
