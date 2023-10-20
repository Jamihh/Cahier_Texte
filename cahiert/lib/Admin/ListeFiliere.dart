import 'package:flutter/material.dart';

class ListeFiliere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Filière"),
      ),
      body: FutureBuilder<List<String>>(
        // Utilisez FutureBuilder pour récupérer la liste des classes depuis le serveur
        future:
            fetchClasses(), // Remplacez fetchClasses par votre fonction de récupération des classes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Affichez un indicateur de chargement pendant la récupération des données
          } else if (snapshot.hasError) {
            return Text("Erreur : ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text("Aucune filière trouvée");
          } else {
            // Affichez la liste des classes
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                  // Ajoutez d'autres informations de classe ici si nécessaire
                );
              },
            );
          }
        },
      ),
    );
  }

  // Fonction de récupération des classes depuis le serveur (à remplacer par votre logique)
  Future<List<String>> fetchClasses() async {
    // Utilisez http ou tout autre moyen pour récupérer la liste des classes depuis le serveur
    // Cette fonction doit retourner une liste de noms de classe (ou tout autre objet que vous souhaitez afficher)
    // Exemple de liste statique à titre d'exemple :
    await Future.delayed(Duration(
        seconds:
            2)); // Simule une attente de 2 secondes (remplacez par votre logique de récupération)
    return ["Filière A", "Filière B", "Filière C"];
  }
}
