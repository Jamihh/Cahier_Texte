import 'package:flutter/material.dart';

class VoirPresence extends StatefulWidget {
  // Ajouter une propriété pour stocker le nombre total de présences
  final int totalPresences;

  VoirPresence({required this.totalPresences});

  @override
  _VoirPresenceState createState() => _VoirPresenceState();
}

class _VoirPresenceState extends State<VoirPresence> {
  // Ajouter une propriété pour stocker le nombre d'absences
  int nombreAbsences = 2;

  @override
  Widget build(BuildContext context) {
    // Calculer le pourcentage d'absences
    double pourcentageAbsences = (nombreAbsences / widget.totalPresences) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text("Voir Mes Présences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Couleur du cercle
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "${pourcentageAbsences.toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Voici le pourcentage de vos absences"),
          ],
        ),
      ),
    );
  }
}
