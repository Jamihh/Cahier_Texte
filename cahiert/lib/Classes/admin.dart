import 'package:cahiert/Classes/etudiant.dart';
import 'package:cahiert/Classes/prof.dart';
import 'package:cahiert/Classes/responsablepedagogique.dart';
import 'package:cahiert/Classes/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Admin {
  int idAdmin;
  int Utilisateurs_idUtilisateurs;

  Utilisateur utilisateur;
  List<Etudiant> etudiants;
  List<Professeur> professeurs;
  List<ResponsablePedagogique> responsable_pedagogiques;

  Admin(
    this.idAdmin,
    this.Utilisateurs_idUtilisateurs,
    this.utilisateur,
    this.etudiants,
    this.professeurs,
    this.responsable_pedagogiques,
  );

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      json['idAdmin'],
      json['Utilisateurs_idUtilisateurs'],
      Utilisateur.fromJson(json['utilisateur']),
      List<Etudiant>.from(json['etudiants'].map((x) => Etudiant.fromJson(x))),
      List<Professeur>.from(
          json['professeurs'].map((x) => Professeur.fromJson(x))),
      List<ResponsablePedagogique>.from(json['responsable_pedagogiques']
          .map((x) => ResponsablePedagogique.fromJson(x))),
    );
  }
}
