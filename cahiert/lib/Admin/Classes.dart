import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  final String filiere;

  Classes({required this.filiere});

  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  int numberOfClasses =
      0; // Nouvelle variable pour stocker le nombre de classes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes de ${widget.filiere}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Nombre de classes créées : $numberOfClasses',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: [
              ClassCard(
                filiere: widget.filiere,
                className: 'Licence 1',
                onClassCreated: _updateNumberOfClasses,
              ),
              ClassCard(
                filiere: widget.filiere,
                className: 'Licence 2',
                onClassCreated: _updateNumberOfClasses,
              ),
              ClassCard(
                filiere: widget.filiere,
                className: 'Licence 3',
                onClassCreated: _updateNumberOfClasses,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Méthode appelée lorsque le responsable pédagogique crée une classe
  void _updateNumberOfClasses() {
    setState(() {
      numberOfClasses++;
    });
  }
}

class ClassCard extends StatelessWidget {
  final String filiere;
  final String className;
  final VoidCallback onClassCreated;

  ClassCard({
    required this.filiere,
    required this.className,
    required this.onClassCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Mettez ici la logique pour gérer le clic sur la classe
          // Vous pouvez naviguer vers la page de cours ou faire d'autres actions
          // Ici, nous simulerons la création d'une classe en appelant la fonction de rappel
          onClassCreated();
        },
        splashColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.school,
                size: 30.0,
              ),
              SizedBox(height: 8.0),
              Text(
                className,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
