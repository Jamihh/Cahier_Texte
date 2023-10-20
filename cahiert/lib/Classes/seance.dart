import 'package:cahiert/Classes/cours.dart';
import 'package:cahiert/Classes/fichesuivicour.dart';
import 'package:cahiert/Classes/liste.dart';
import 'package:cahiert/Classes/prof.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class Seance {
  int idSeance;
  String numero;
  DateTime date;
  String heureDebut;
  String heureFin;
  String description;
  int coursIdCours;
  int professeurIdProf;

  Cour cour;
  Professeur professeur;
  List<FicheSuiviCour> ficheSuiviCours;
  List<ListePresence> listepresence;

  Seance(
    this.idSeance,
    this.numero,
    this.date,
    this.heureDebut,
    this.heureFin,
    this.description,
    this.coursIdCours,
    this.professeurIdProf,
    this.cour,
    this.professeur,
    this.ficheSuiviCours,
    this.listepresence,
  );

  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      json['idSeance'],
      json['numero'],
      json['date'],
      json['heureDebut'],
      json['heureFin'],
      json['description'],
      json['Cours_idCours'],
      json['Professeur_idProf'],
      Cour.fromJson(json['cour']),
      Professeur.fromJson(json['professeur']),
      List<FicheSuiviCour>.from(
          json['fichesuivicour'].map((x) => FicheSuiviCour.fromJson(x))),
      List<ListePresence>.from(
          json['listepresence'].map((x) => ListePresence.fromJson(x))),
    );
  }
}
