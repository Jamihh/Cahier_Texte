//import 'package:cahiert/Admin/filiere.dart';
import 'package:flutter/material.dart';
import 'package:cahiert/Classes/wsManager.dart';

void main() {
  runApp(const MaterialApp(
    home: CreerClasse(),
    debugShowCheckedModeBanner: false,
  ));
}

class CreerClasse extends StatefulWidget {
  const CreerClasse({Key? key}) : super(key: key);

  @override
  _CreerClasseState createState() => _CreerClasseState();
}

class _CreerClasseState extends State<CreerClasse> {
  final TextEditingController _nomClasseController = TextEditingController();
  final TextEditingController _nbrEtuController = TextEditingController();
  WsManager wsManager = WsManager();

  var idUser;

  String _mySelection = "";
  bool isLoading = true;
  List filiere = [];

  Future getDatas() async {
    List datas = await WsManager().getFiliere();
    setState(() {
      filiere = datas;
      _mySelection = datas[0]['idFiliere'].toString();
    });
    print('Finished');
    print(filiere);
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatas().then((value) {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer une classe"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/class.png', // Remplacez avec le chemin correct de votre image
                width: 350,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5.0),
              Text(
                'Créer une classe',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 45, 169, 247),
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 5.0),
              _buildTextField(
                _nomClasseController,
                'Nom de la classe',
                Icons.school_outlined,
              ),
              SizedBox(height: 5.0),
              _buildTextField(
                _nbrEtuController,
                'Nombre étudiants',
                Icons.format_list_numbered_rtl,
              ),
              SizedBox(height: 5.0),
              DropdownButton<String>(
                items: filiere.map((classe) {
                  print(classe);
                  return new DropdownMenuItem<String>(
                    value: classe['idFiliere'].toString(),
                    child: new Text(classe['nom_fil']),
                  );
                }).toList(),
                value: _mySelection,
                hint: Text('Sélectionnez la filière'),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _mySelection = '$value';
                  });
                },
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () async {
                  // Récupérer les valeurs saisies dans les contrôleurs
                  idUser = await wsManager.getRespId();
                  //idFiliere = await wsManager.getIdFiliere();
                  var classe = {
                    "Responsable pedagogique_idResp": idUser,
                    "filière_idFiliere": _mySelection,
                    "nomClasse": _nomClasseController.text,
                    "nbrEtu": _nbrEtuController.text,
                  };
                  print(classe);
                  var response = await new WsManager().createClasse(classe);
                  print('création classe: ${response}');
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
class Classe {
  String nomClasse;
  String nbrEtu;

  Classe(this.nomClasse, this.nbrEtu);

  // Convertir la filière en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'nomClasse': nomClasse,
      'nbrEtu': nbrEtu,
    };
  }
}
