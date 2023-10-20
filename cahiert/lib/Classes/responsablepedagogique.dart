import 'package:cahiert/Classes/admin.dart';
import 'package:cahiert/Classes/utilisateur.dart';
import 'package:flutter/material.dart';

class ResponsablePedagogique {
  int idResp;
  String fonction;
  int adminIdAdmin;
  int utilisateursIdUtilisateurs;

  Admin admin;
  Utilisateur utilisateur;

  ResponsablePedagogique(
    this.idResp,
    this.fonction,
    this.adminIdAdmin,
    this.utilisateursIdUtilisateurs,
    this.admin,
    this.utilisateur,
  );

  factory ResponsablePedagogique.fromJson(Map<String, dynamic> json) {
    return ResponsablePedagogique(
      json['idResp'],
      json['fonction'],
      json['Admin_idAdmin'],
      json['Utilisateurs_idUtilisateurs'],
      Admin.fromJson(json['admin']),
      Utilisateur.fromJson(json['utilisateur']),
    );
  }
}
