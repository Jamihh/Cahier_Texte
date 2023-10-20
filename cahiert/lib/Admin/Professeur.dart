import 'package:cahiert/Classes/wsManager.dart';
import 'package:flutter/material.dart';

class Professeur extends StatefulWidget {
  const Professeur({Key? key}) : super(key: key);

  @override
  _ProfesseurState createState() => _ProfesseurState();
}

class _ProfesseurState extends State<Professeur> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _domaineController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _coursEnseignesController =
      TextEditingController();
  final TextEditingController _mdpController = TextEditingController();

  WsManager wsManager = WsManager();
  var idUser;

  bool _obscurePassword = true;

  bool _nomIsEmpty = false;
  bool _prenomIsEmpty = false;
  bool _emailIsEmpty = false;
  bool _telIsEmpty = false;
  bool _adresseIsEmpty = false;
  bool _genreIsEmpty = false;
  bool _domaineIsEmpty = false;
  bool _gradeIsEmpty = false;
  bool _coursEnseignesIsEmpty = false;
  bool _mdpIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 169, 247),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'EasyClassNotes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 45, 169, 247),
                ),
                child: Icon(
                  Icons.person_add_alt_1_outlined,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Création de compte',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 45, 169, 247),
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 32.0),
              _buildTextField(_nomController, 'Nom', Icons.person, _nomIsEmpty),
              _buildTextField(
                  _prenomController, 'Prénom', Icons.person, _prenomIsEmpty),
              _buildTextField(_emailController, 'Adresse email', Icons.email,
                  _emailIsEmpty),
              _buildTextField(_telController, 'Numéro de téléphone',
                  Icons.phone, _telIsEmpty),
              _buildTextField(_adresseController, 'Adresse', Icons.location_on,
                  _adresseIsEmpty),
              _buildTextField(
                  _genreController, 'Genre', Icons.person, _genreIsEmpty),
              _buildTextField(
                  _domaineController, 'Domaine', Icons.domain, _domaineIsEmpty),
              _buildTextField(
                  _gradeController, 'Grade', Icons.menu_book, _gradeIsEmpty),
              _buildTextField(_coursEnseignesController, 'Cours enseignés',
                  Icons.menu, _coursEnseignesIsEmpty),
              _buildPasswordTextField(
                  _mdpController, 'Mot de passe', _mdpIsEmpty),
              ElevatedButton(
                onPressed: () async {
                  idUser = await wsManager.getAdminId();
                  if (_isFormValid()) {
                    var professeur = {
                      "Admin_idAdmin": idUser,
                      "nom": _nomController.text,
                      "prenom": _prenomController.text,
                      "email": _emailController.text,
                      "telephone": _telController.text,
                      "adresse": _adresseController.text,
                      "genre": _genreController.text,
                      "domaine": _domaineController.text,
                      "grade": _gradeController.text,
                      "coursEnseignes": _coursEnseignesController.text,
                      "mdp": _mdpController.text
                    };
                    print(professeur);
                    var response =
                        await new WsManager().createProfesseur(professeur);
                    print('Création professeur: $response');

                    if (response == 'success') {
                      _showSuccessDialog();
                    }
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
    IconData icon,
    bool isEmpty,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(icon, color: Color.fromARGB(255, 45, 169, 247)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            obscureText: label.toLowerCase().contains('mot de passe'),
          ),
          if (isEmpty)
            Text(
              'Veuillez entrer un $label',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField(
    TextEditingController controller,
    String label,
    bool isEmpty,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon:
                  Icon(Icons.lock, color: Color.fromARGB(255, 45, 169, 247)),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromARGB(255, 45, 169, 247),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            obscureText: _obscurePassword,
          ),
          if (isEmpty)
            Text(
              'Veuillez entrer un $label',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Succès'),
          content: Text('Le compte a été créé avec succès.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Ferme le dialogue de succès
                // Vous pouvez également ajouter d'autres actions après la création réussie ici si nécessaire.
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _isFormValid() {
    setState(() {
      _nomIsEmpty = _nomController.text.isEmpty;
      _prenomIsEmpty = _prenomController.text.isEmpty;
      _emailIsEmpty = _emailController.text.isEmpty;
      _telIsEmpty = _telController.text.isEmpty;
      _adresseIsEmpty = _adresseController.text.isEmpty;
      _genreIsEmpty = _genreController.text.isEmpty;
      _domaineIsEmpty = _domaineController.text.isEmpty;
      _gradeIsEmpty = _gradeController.text.isEmpty;
      _coursEnseignesIsEmpty = _coursEnseignesController.text.isEmpty;
      _mdpIsEmpty = _mdpController.text.isEmpty;

      // Si un champ est vide, on retourne false
      if (_nomIsEmpty ||
          _prenomIsEmpty ||
          _emailIsEmpty ||
          _telIsEmpty ||
          _adresseIsEmpty ||
          _genreIsEmpty ||
          _domaineIsEmpty ||
          _gradeIsEmpty ||
          _coursEnseignesIsEmpty ||
          _mdpIsEmpty) {}
    });

    return true;
  }
}

void main() {
  runApp(const MaterialApp(
    home: Professeur(),
  ));
}
