import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: dashboard(),
    debugShowCheckedModeBanner: false,
  ));
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int numberOfProfessors = 2;
  int numberOfPedagogicalResponsibles = 0;
  int numberOfStudents = 0;

  @override
  void initState() {
    super.initState();
    // Au moment de la création de l'objet d'état, déclenchez le chargement initial des données.
    fetchDashboardData();
  }

  void fetchDashboardData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.16:8000/dashboard'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        numberOfProfessors = data['professors'];
        numberOfPedagogicalResponsibles = data['pedagogicalResponsibles'];
        numberOfStudents = data['students'];
      });
    } else {
      print(
          "Erreur lors de la récupération des données du backend: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tableau de bord administrateur"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserCategoryCard(
              category: 'Professeurs',
              count: 5,
              icon: Icons.school,
            ),
            const SizedBox(height: 16.0),
            UserCategoryCard(
              category: 'Responsables Pédagogiques',
              count: 3,
              icon: Icons.supervised_user_circle,
            ),
            const SizedBox(height: 16.0),
            UserCategoryCard(
              category: 'Étudiants',
              count: 3,
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}

class UserCategoryCard extends StatelessWidget {
  final String category;
  final int count;
  final IconData icon;

  const UserCategoryCard({
    required this.category,
    required this.count,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 8.0),
            Text(
              category,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Nombre : $count',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
