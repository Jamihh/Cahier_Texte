// voirCahier.dart

import 'package:flutter/material.dart';

class VoirCahier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voir Cahier de Texte"),
      ),
      body: Center(
        child: Text("Contenu de la page Voir Cahier de Texte"),
      ),
    );
  }
}
