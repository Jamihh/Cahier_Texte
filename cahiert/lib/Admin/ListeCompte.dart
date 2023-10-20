//import 'dart:convert';
import 'package:cahiert/Classes/wsManager.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: ListeCompte(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListeCompte extends StatefulWidget {
  const ListeCompte({Key? key}) : super(key: key);

  @override
  _ListeCompteState createState() => _ListeCompteState();
}

class _ListeCompteState extends State<ListeCompte> {
  var etudiants;

  getDatas() async {
    etudiants = await WsManager().getEtudiant();
    print(etudiants);
    setState(() {}); // Rafraîchir la page après avoir obtenu les données
  }

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des comptes"),
      ),
      body: etudiants == null
          ? Center(
              child:
                  CircularProgressIndicator(), // Afficher un indicateur de chargement en attendant les données
            )
          : ListView.builder(
              itemCount: etudiants.length,
              itemBuilder: (context, index) {
                // Utilisez les données de l'étudiant à l'index actuel pour afficher les informations
                var etudiant = etudiants[index];
                return ListTile(
                  title: Text(etudiant[
                      'idEtu']), // Remplacez 'nom' par le champ approprié
                  subtitle: Text(etudiant['nom']
                      .toString()), // Remplacez 'prenom' par le champ approprié
                  // Ajoutez d'autres widgets pour afficher plus d'informations sur l'étudiant
                );
              },
            ),
    );
  }
}
