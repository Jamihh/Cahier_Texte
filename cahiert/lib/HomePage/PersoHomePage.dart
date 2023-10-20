import 'package:cahiert/ClassHome.dart';
import 'package:cahiert/CoursHome.dart';
import 'package:cahiert/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:cahiert/Prof/CahierTexte.dart';
import 'package:cahiert/Prof/ListePresence.dart';
import 'package:cahiert/Responsable/creerClasse.dart';
import 'package:cahiert/Responsable/creerCours.dart';
import 'package:cahiert/Responsable/etudiantCompte.dart';

void main() {
  runApp(const MaterialApp(
    home: PersoHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class PersoHomePage extends StatelessWidget {
  const PersoHomePage({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 160, 254),
        title: const Text('EasyClassNotes'),
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
                  "Responsable pédagogique"), // Remplacez par le nom de l'utilisateur
              accountEmail: const Text(
                  "resp@gmail.com"), // Remplacez par le prénom de l'utilisateur
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
                color: Colors.lightBlue,
              ), // Icône pour la liste des patients
              title: const Text('Accueil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersoHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.class_outlined), // Icône pour créer un dossier patient
              title: const Text('Classe'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassHome(),
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0), // Ajustez cette valeur pour l'espace vide en haut
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/a.png', // Remplacez avec le chemin correct de votre image
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Bienvenue Resp.P !", // Texte de bienvenue
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top:
                                  5.0), // Marge supérieure pour faire descendre les Card
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 2.0,
                            children: [
                              Card(
                                margin: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const ClassHome(),
                                      ),
                                    );
                                  },
                                  splashColor:
                                      const Color.fromARGB(255, 78, 160, 254),
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.class_outlined,
                                          size: 30.0,
                                        ),
                                        Text(
                                          "Classes",
                                          style: TextStyle(fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const CoursHome(),
                                      ),
                                    );
                                  },
                                  splashColor:
                                      const Color.fromARGB(255, 78, 160, 254),
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.school,
                                          size: 30.0,
                                        ),
                                        Text(
                                          "Cours",
                                          style: TextStyle(fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ListePresence(),
                                      ),
                                    );
                                  },
                                  splashColor:
                                      const Color.fromARGB(255, 78, 160, 254),
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.list,
                                          size: 30.0,
                                        ),
                                        Text(
                                          "Listes présences",
                                          style: TextStyle(fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CahierTextePage(),
                                      ),
                                    );
                                  },
                                  splashColor:
                                      const Color.fromARGB(255, 78, 160, 254),
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.book,
                                          size: 30.0,
                                        ),
                                        Text(
                                          "Cahier de texte",
                                          style: TextStyle(fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deconnexion(BuildContext context) {
    // Votre code de déconnexion va ici
    // Par exemple, vous pouvez naviguer vers la page de connexion
    Navigator.pushReplacementNamed(context, '/welcomepage');
  }

  Widget _construireElementMenu({
    required IconData icon,
    required String titre,
    required VoidCallback action,
  }) {
    return ListTile(
      leading: Icon(icon),
      iconColor: Colors.lightBlue,
      title: Text(titre),
      onTap: action,
    );
  }

  void _handleMenuItemClick(int value, BuildContext context) {
    switch (value) {
      case 1:
        // Accueil
        // Ajoutez la logique ici si nécessaire
        break;
      case 2:
        // ETUDIANT
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => etudiantCompte(),
          ),
        );
        break;
      case 3:
        // Présences
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreerClasse(),
          ),
        );
        break;
      case 4:
        // Présences
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreerCours(),
          ),
        );
        break;
      case 5:
        // Déconnexion
        _deconnexion(context);
        break;
    }
  }
}
