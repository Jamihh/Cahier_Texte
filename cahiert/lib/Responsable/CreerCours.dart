import 'package:cahiert/Classes/wsManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CreerCours(),
    debugShowCheckedModeBanner: false,
  ));
}

class CreerCours extends StatefulWidget {
  const CreerCours({Key? key}) : super(key: key);

  @override
  _CreerCoursState createState() => _CreerCoursState();
}

class _CreerCoursState extends State<CreerCours> {
  final TextEditingController _intituleCoursController =
      TextEditingController();
  final TextEditingController _dureeController = TextEditingController();
  WsManager wsManager = WsManager();

  var idUser;

  String _mySelection = "";
  bool isLoading = true;
  List classes = [];
  String _selectedProf = "";
  List prof = [];

  Future getDatas() async {
    // Appeler la méthode sur l'instance créée
    List datas = await WsManager().getClasses();
    List datass = await WsManager().getProf();

    setState(() {
      classes = datas;
      prof = datass;
      _mySelection = datas[0]['idClasse'].toString();
      _selectedProf = datass[0]['idProf'].toString();
    });

    print('Finished');
    print(classes);
    print(prof);
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
        title: const Text("Créer un Cours"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/cours.png', // Remplacez avec le chemin correct de votre image
                width: 350,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5.0),
              Text(
                'Créer un cours',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 45, 169, 247),
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 5.0),
              _buildTextField(
                _intituleCoursController,
                'Intitulé du cours',
                Icons.school_outlined,
              ),
              _buildTextField(
                _dureeController,
                'Durée du cours',
                Icons.format_list_numbered_rtl,
              ),
              SizedBox(height: 5.0),
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
              SizedBox(height: 5.0),
              DropdownButton<String>(
                items: prof.map((classe) {
                  print(classe);
                  return new DropdownMenuItem<String>(
                    value: classe['idProf'].toString(),
                    child: new Text('${classe['utilisateur']['nom']} '
                        '${classe['utilisateur']['prenom']}'),
                  );
                }).toList(),
                value: _selectedProf,
                hint: Text('Sélectionnez le professeur '),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _selectedProf = '$value';
                  });
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  // Récupérer les valeurs saisies dans les contrôleurs
                  idUser = await wsManager.getRespId();
                  var cours = {
                    "Responsable pedagogique_idResp": idUser,
                    "Classe_idClasse": _mySelection,
                    "Professeur_idProf": _selectedProf,
                    "intitule": _intituleCoursController.text,
                    "duree": _dureeController.text,
                  };
                  print(cours);
                  var response = await new WsManager().createCours(cours);
                  print('création cours: ${response}');
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
