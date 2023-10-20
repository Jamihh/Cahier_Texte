import 'package:flutter/material.dart';

class etudiantCompte extends StatefulWidget {
  @override
  _etudiantCompteState createState() => _etudiantCompteState();
}

class _etudiantCompteState extends State<etudiantCompte> {
  final _formKey = GlobalKey<FormState>();

  String? _nomErrorText;
  String? _prenomErrorText;
  String? _emailErrorText;
  String? _telErrorText;
  String? _adresseErrorText;
  String? _passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un Compte'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 1.8,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Création de Compte étudiant',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    labelText: 'Nom',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                    errorText: _nomErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Prénom',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un prénom';
                      }
                      return null;
                    },
                    errorText: _prenomErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une adresse email';
                      }
                      // Ajoutez ici une validation d'email plus avancée si nécessaire.
                      return null;
                    },
                    errorText: _emailErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Numéro de téléphone',
                    prefixIcon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un numéro de téléphone';
                      }
                      // Ajoutez ici un code de validation du numéro de téléphone si nécessaire.
                      return null;
                    },
                    errorText: _telErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Adresse',
                    prefixIcon: Icons.location_on,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une adresse';
                      }
                      return null;
                    },
                    errorText: _adresseErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Genre',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer le genre';
                      }
                      return null;
                    },
                    errorText: _adresseErrorText,
                  ),
                  _buildTextField(
                    labelText: 'Mot de Passe',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un mot de passe';
                      }
                      // Ajoutez ici des règles de validation du mot de passe si nécessaire.
                      return null;
                    },
                    errorText: _passwordErrorText,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Toutes les validations sont passées
                        // Gérez l'enregistrement du compte ici
                      }
                    },
                    child: Text('Enregistrer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData prefixIcon,
    bool obscureText = false,
    required String? Function(String?) validator,
    String? errorText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorText: errorText,
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
