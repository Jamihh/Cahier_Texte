import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: ListePresence(),
  ));
}

class Etudiant {
  final String id;
  final String nom;
  final String prenom;

  Etudiant(this.id, this.nom, this.prenom);
}

class ListePresence extends StatefulWidget {
  const ListePresence({Key? key}) : super(key: key);

  @override
  _ListePresenceState createState() => _ListePresenceState();
}

class _ListePresenceState extends State<ListePresence> {
  List<Etudiant> etudiants = [];
  String classes = '';
  Map<String, bool> presenceMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste d'étudiants"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/c.png', // Remplacez avec le chemin correct de votre image
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(labelText: 'Classe'),
                      onChanged: (value) {
                        setState(() {
                          classes = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      fetchEtudiants();
                    },
                    child: const Text("Charger la liste"),
                  ),
                ],
              ),
            ),
            if (etudiants.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 16.0),
                  Text(
                    "Étudiants de la classe $classes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: etudiants.length,
                    itemBuilder: (context, index) {
                      final etudiant = etudiants[index];
                      final etudiantFullName =
                          "${etudiant.prenom} ${etudiant.nom}";

                      return ListTile(
                        title: Text(etudiantFullName),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  presenceMap[etudiant.id] = false;
                                });
                              },
                              child: Text("A"),
                            ),
                            const SizedBox(width: 8.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                setState(() {
                                  presenceMap[etudiant.id] = true;
                                });
                              },
                              child: Text("P"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchEtudiants() async {
    try {
      final response = await http.get(
        Uri.parse('https://192.168.1.16:8000/etudiants/$classes'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          etudiants = data
              .map((e) => Etudiant(e['id'], e['nom'], e['prenom']))
              .toList();
          // Réinitialiser la map de présence pour la nouvelle liste
          presenceMap.clear();
          // Initialiser la présence de chaque étudiant à false
          for (var etudiant in etudiants) {
            presenceMap[etudiant.id] = false;
          }
        });
      } else {
        // Gérer les erreurs
        print(
            'Erreur lors de la récupération des étudiants. Code : ${response.statusCode}, Corps : ${response.body}');
        throw Exception('Échec du chargement des étudiants');
      }
    } catch (error) {
      // Gérer les erreurs réseau
      print('Erreur: $error');
    }
  }
}
