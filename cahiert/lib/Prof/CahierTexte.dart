import 'package:cahiert/Classes/wsManager.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MaterialApp(
    home: CahierTextePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CahierTextePage extends StatefulWidget {
  const CahierTextePage({Key? key}) : super(key: key);

  @override
  _CahierTextePageState createState() => _CahierTextePageState();
}

class CahierTexte {
  final String titre;
  final String description;
  final String intituleCours;
  final String date;
  final DateTime dateTime;

  CahierTexte(
    this.titre,
    this.description,
    this.intituleCours,
    this.date,
    this.dateTime,
  );
}

class _CahierTextePageState extends State<CahierTextePage> {
  final List<CahierTexte> cahierTexteList = [];
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _contenuController = TextEditingController();
  final TextEditingController _intituleCoursController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  WsManager wsManager = WsManager();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool showCahierTexteForm = false;
  bool showSeanceForm = false;

  var idUser;

  String _mySelectionCours = "";
  bool isLoading = true;
  List cours = [];
  String _mySelectionSeance = "";
  List seance = [];

  Future getDatas() async {
    // Appeler la méthode sur l'instance créée
    List datas = await WsManager().getCours();
    List datass = await WsManager().getSeance();

    setState(() {
      cours = datas;
      seance = datass;
      _mySelectionCours = datas[0]['idCours'].toString();
      _mySelectionSeance = datass[0]['idSeance'].toString();
    });

    print('Finished');
    print(cours);
    print(seance);
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
        title: const Text("Cahier de Texte"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showCahierTexteForm = !showCahierTexteForm;
                    showSeanceForm = false;
                  });
                },
                child: const Text("Remplir le Cahier"),
              ),
              if (showCahierTexteForm) ...[
                const SizedBox(height: 16.0),
                Text(
                  "Remplir le Cahier",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _titreController,
                  decoration: const InputDecoration(labelText: 'Titre'),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _contenuController,
                  decoration: const InputDecoration(labelText: 'Contenu'),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _intituleCoursController,
                  decoration:
                      const InputDecoration(labelText: "Intitulé du cours"),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: "Date"),
                ),
                SizedBox(height: 5.0),
                DropdownButton<String>(
                  items: cours.map((classe) {
                    print(classe);
                    return new DropdownMenuItem<String>(
                      value: classe['idCours'].toString(),
                      child: new Text(classe['intitule']),
                    );
                  }).toList(),
                  value: _mySelectionCours,
                  hint: Text('cours'),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _mySelectionCours = '$value';
                    });
                  },
                ),
                SizedBox(height: 5.0),
                DropdownButton<String>(
                  items: seance.map((classe) {
                    print(classe);
                    return new DropdownMenuItem<String>(
                      value: classe['idSeance'].toString(),
                      child: new Text(classe['description']),
                    );
                  }).toList(),
                  value: _mySelectionSeance,
                  hint: Text('Sélectionnez la séance '),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _mySelectionSeance = '$value';
                    });
                  },
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    // Récupérer les valeurs saisies dans les contrôleurs
                    idUser = await wsManager.getProfId();
                    var fiche = {
                      "Professeur_idProf": idUser,
                      "Cours_idCours": _mySelectionCours,
                      "Seance_idSeance": _mySelectionSeance,
                      "titre": _titreController.text,
                      "intituleCours": _intituleCoursController.text,
                      "date": _dateController.text,
                    };
                    print(fiche);
                    var response = await new WsManager().createFiche(fiche);
                    print('création fiche: ${response}');
                  },
                  child: const Text("Enregistrer"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
