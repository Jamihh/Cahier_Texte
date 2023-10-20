import 'package:cahiert/Classes/admin.dart';
import 'package:cahiert/Classes/classe.dart';
import 'package:cahiert/Classes/filiere.dart';
import 'package:cahiert/Classes/liste.dart';
import 'package:cahiert/Classes/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Etudiant {
  int? idEtu;
  int Classe_idClasse;
  int? Utilisateurs_idUtilisateurs;
  int filiere_idFiliere;
  int Admin_idAdmin;

  Admin? admin;
  Classe? classe;
  Utilisateur? utilisateur;
  Filiere? filiere;
  List<ListePresence>? listepresence;

  Etudiant(
    this.idEtu,
    this.Classe_idClasse,
    this.Utilisateurs_idUtilisateurs,
    this.filiere_idFiliere,
    this.Admin_idAdmin,
    this.admin,
    this.classe,
    this.utilisateur,
    this.filiere,
    this.listepresence,
  );

  factory Etudiant.fromJson(Map<String, dynamic> json) {
    return Etudiant(
      json['idEtu'],
      json['Classe_idClasse'],
      json['Utilisateurs_idUtilisateurs'],
      json['filière_idFiliere'],
      json['Admin_idAdmin'],
      Admin.fromJson(json['admin']),
      Classe.fromJson(json['classe']),
      Utilisateur.fromJson(json['utilisateur']),
      Filiere.fromJson(json['filiere']),
      List<ListePresence>.from(
          json['listepresence'].map((x) => ListePresence.fromJson(x))),
    );
  }
}
