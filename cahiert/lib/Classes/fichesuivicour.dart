import 'package:cahiert/Classes/cours.dart';
import 'package:cahiert/Classes/prof.dart';
import 'package:cahiert/Classes/seance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FicheSuiviCour {
  int idFiche;
  String titre;
  String contenu;
  String intituleCours;
  DateTime date;
  int Cours_idCours;
  int Seance_idSeance;
  int Professeur_idProf;

  Cour? cour;
  Professeur? professeur;
  Seance? seance;

  FicheSuiviCour(
    this.idFiche,
    this.titre,
    this.contenu,
    this.intituleCours,
    this.date,
    this.Cours_idCours,
    this.Seance_idSeance,
    this.Professeur_idProf,
  );

  factory FicheSuiviCour.fromJson(Map<String, dynamic> json) {
    return FicheSuiviCour(
      json['idFiche'],
      json['titre'],
      json['contenu'],
      json['intituleCours'],
      DateFormat("yyyy-MM-dd").parse(json['date']),
      json['Cours_idCours'],
      json['Seance_idSeance'],
      json['Professeur_idProf'],
    );
  }
}
