import 'package:cahiert/Classes/wsManager.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: CreerSeance(),
    debugShowCheckedModeBanner: false,
  ));
}

class CreerSeance extends StatefulWidget {
  const CreerSeance({Key? key}) : super(key: key);

  @override
  _CreerSeanceState createState() => _CreerSeanceState();
}

class _CreerSeanceState extends State<CreerSeance> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _heuredebutController = TextEditingController();
  TextEditingController _heurefinController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  WsManager wsManager = WsManager();
  var idUser;
  DateTime? _dateSeance;
  TimeOfDay? _heureDebut;
  TimeOfDay? _heureFin;

  String _mySelectionCours = "";
  bool isLoading = true;
  List cours = [];

  Future getDatas() async {
    // Appeler la méthode sur l'instance créée
    List datas = await WsManager().getCours();

    setState(() {
      cours = datas;

      _mySelectionCours = datas[0]['idCours'].toString();
    });

    print('Finished');
    print(cours);
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
        title: const Text("Créer une séance"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _numeroController,
                decoration:
                    const InputDecoration(labelText: 'Numéro de séance'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le numéro de séance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(labelText: 'Date'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer la date';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: const Text('Sélectionner'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _heuredebutController,
                      decoration:
                          const InputDecoration(labelText: 'Heure début'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer lHeure début';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _selectTime(context, isStartTime: true);
                    },
                    child: const Text('Sélectionner'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _heurefinController,
                      decoration: const InputDecoration(labelText: 'Heure fin'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer heure fin';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _selectTime(context, isStartTime: false);
                    },
                    child: const Text('Sélectionner'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer la description';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                items: cours.map((classe) {
                  print(classe);
                  return new DropdownMenuItem<String>(
                    value: classe['idCours'].toString(),
                    child: new Text(classe['intitule']),
                  );
                }).toList(),
                value: _mySelectionCours,
                hint: Text('Cours'),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _mySelectionCours = '$value';
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  idUser = await wsManager.getProfId();
                  //classe = await wsManager.getClasseId();
                  // Gérer l'inscription ici
                  var seance = {
                    "Professeur_idProf": idUser,
                    "Cours_idCours": _mySelectionCours,
                    "numero": _numeroController.text,
                    "date": _dateController.text,
                    "heure_debut": _heuredebutController.text,
                    "heure_fin": _heurefinController.text,
                    "description": _descriptionController.text
                  };
                  print(seance);
                  var response = await new WsManager().createSeance(seance);
                  print('création seance: ${response}');
                },
                child: const Text('Créer la séance'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reste du code...

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _dateSeance) {
      setState(() {
        _dateSeance = pickedDate;
        _dateController.text = _dateSeance.toString();
      });
    }
  }

  Future<void> _selectTime(BuildContext context,
      {required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _heureDebut = pickedTime;
          _heuredebutController.text = _heureDebut.toString();
        } else {
          _heureFin = pickedTime;
          _heurefinController.text = _heureFin.toString();
        }
      });
    }
  }
}
