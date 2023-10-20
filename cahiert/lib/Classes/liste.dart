import 'package:cahiert/Classes/classe.dart';
import 'package:cahiert/Classes/etudiant.dart';
import 'package:cahiert/Classes/prof.dart';
import 'package:cahiert/Classes/seance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListePresence {
  int idListe;
  String date;
  int Professeur_idProf;
  int Etudiant_idEtu;
  int Classe_idClasse;
  int Seance_idSeance;

  Classe classe;
  Etudiant etudiant;
  Professeur professeur;
  Seance seance;

  ListePresence(
    this.idListe,
    this.date,
    this.Professeur_idProf,
    this.Etudiant_idEtu,
    this.Classe_idClasse,
    this.Seance_idSeance,
    this.classe,
    this.etudiant,
    this.professeur,
    this.seance,
  );

  factory ListePresence.fromJson(Map<String, dynamic> json) {
    return ListePresence(
      json['idListe'],
      json['date'],
      json['Professeur_idProf'],
      json['Etudiant_idEtu'],
      json['Classe_idClasse'],
      json['Seance_idSeance'],
      Classe.fromJson(json['classe']),
      Etudiant.fromJson(json['etudiant']),
      Professeur.fromJson(json['professeur']),
      Seance.fromJson(json['seance']),
    );
  }
}
