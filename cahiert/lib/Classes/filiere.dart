import 'package:cahiert/Classes/classe.dart';
import 'package:cahiert/Classes/etudiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Filiere {
  int idFiliere;
  String nom_fil;
  String nom_departement;
  int Admin_idAdmin;

  Filiere(
    this.idFiliere,
    this.nom_fil,
    this.nom_departement,
    this.Admin_idAdmin,
  );

  factory Filiere.fromJson(Map<String, dynamic> json) {
    return Filiere(
      json['idFiliere'],
      json['nom_fil'],
      json['nom_departement'],
      json['Admin_idAdmin'],
    );
  }
}
