import 'package:flutter/material.dart';
import 'package:cahiert/Classes/wsManager.dart';

void main() {
  runApp(const MaterialApp(
    home: filiere(),
    debugShowCheckedModeBanner: false,
  ));
}

class filiere extends StatefulWidget {
  const filiere({Key? key}) : super(key: key);

  @override
  _filiereState createState() => _filiereState();
}

class _filiereState extends State<filiere> {
  final TextEditingController _nomFiliereController = TextEditingController();
  final TextEditingController _nomDepartementController =
      TextEditingController();
  WsManager wsManager = WsManager();
  var idUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer une Filière"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 1.0),
              Container(
                width: 330.0,
                height: 200.0,
                child: Image.asset(
                  'assets/images/fil.png',
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Créer une filière',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 45, 169, 247),
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 5.0),
              _buildTextField(
                _nomFiliereController,
                'Nom de la filière',
                Icons.school,
              ),
              _buildTextField(
                _nomDepartementController,
                'Nom du département',
                Icons.location_city,
              ),
              ElevatedButton(
                onPressed: () async {
                  idUser = await wsManager.getAdminId();
                  var filiere = {
                    "Admin_idAdmin": idUser,
                    "nom_fil": _nomFiliereController.text,
                    "nom_departement": _nomDepartementController.text,
                  };

                  // Appel à la méthode de création de filière
                  var response = await wsManager.createFiliere(filiere);

                  // Vérifier si la filière a été créée avec succès
                  if (response != null && response['success'] == true) {
                    // Afficher un SnackBar avec un message de succès
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('La filière a été enregistrée avec succès!'),
                        duration: Duration(
                            seconds: 3), // Durée d'affichage du SnackBar
                      ),
                    );

                    // Réinitialiser les contrôleurs après l'enregistrement
                    _nomFiliereController.clear();
                    _nomDepartementController.clear();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 45, 169, 247),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 45, 169, 247)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

// Modèle de données pour la filière
class Filiere {
  String nomFiliere;
  String nomDepartement;
  int Admin_idAdmin; // Ajout du champ adminIdAdmin

  Filiere(this.nomFiliere, this.nomDepartement, this.Admin_idAdmin);

  // Convertir la filière en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'nom_fil': nomFiliere,
      'nom_departement': nomDepartement,
      'Admin_idAdmin': Admin_idAdmin, // Inclure le champ adminIdAdmin
    };
  }
}
