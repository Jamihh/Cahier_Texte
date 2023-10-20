import 'package:cahiert/Classes/wsManager.dart';
import 'package:flutter/material.dart';
//import 'package:cahiert/Classes/session.dart' as session;

class Etudiant extends StatefulWidget {
  const Etudiant({Key? key}) : super(key: key);

  @override
  _EtudiantState createState() => _EtudiantState();
}

class _EtudiantState extends State<Etudiant> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  WsManager wsManager = WsManager();
  var idUser;
  var classe;
  String _mySelection = "";
  bool isLoading = true;
  List classes = [];

  Future getDatas() async {
    // Créer une instance de WsManager

    // Appeler la méthode sur l'instance créée
    List datas = await WsManager().getClasses();

    setState(() {
      classes = datas;
      _mySelection = datas[0]['idClasse'].toString();
    });

    print('Finished');
    print(classes);
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatas().then((value) {
      isLoading = false;
    });
    super.initState();
  }

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 169, 247),
        iconTheme: IconThemeData(color: Colors.black),
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                    _buildTextField(_nomController, 'Nom', Icons.person),
                    _buildTextField(_prenomController, 'Prénom', Icons.person),
                    _buildTextField(
                        _emailController, 'Adresse email', Icons.email),
                    _buildTextField(
                        _telController, 'Numéro de téléphone', Icons.phone),
                    _buildTextField(
                        _adresseController, 'Adresse', Icons.location_on),
                    _buildTextField(_genreController, 'Genre', Icons.person),
                    DropdownButton<String>(
                      items: classes.map((classe) {
                        print(classe);
                        return new DropdownMenuItem<String>(
                          value: classe['idClasse'].toString(),
                          child: new Text(classe['nomClasse']),
                        );
                      }).toList(),
                      value: _mySelection,
                      hint: Text('Classe'),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          _mySelection = '$value';
                        });
                      },
                    ),
                    _buildPasswordTextField(_mdpController, 'Mot de passe'),
                    ElevatedButton(
                      onPressed: () async {
                        idUser = await wsManager.getAdminId();
                        //classe = await wsManager.getClasseId();
                        // Gérer l'inscription ici
                        var etudiant = {
                          "Admin_idAdmin": idUser,
                          "Classe_idClasse": _mySelection,
                          "nom": _nomController.text,
                          "prenom": _prenomController.text,
                          "email": _emailController.text,
                          "telephone": _telController.text,
                          "adresse": _adresseController.text,
                          "genre": _genreController.text,
                          "mdp": _mdpController.text
                        };
                        print(etudiant);
                        var response =
                            await new WsManager().createEtudiant(etudiant);
                        print('création etudiant: ${response}');
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
        obscureText: label.toLowerCase().contains('mot de passe'),
      ),
    );
  }

  Widget _buildPasswordTextField(
    TextEditingController controller,
    String label,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Etudiant(),
  ));
}
