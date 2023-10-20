import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Professeur {
  int idProf;
  String domaine;
  String grade;
  String coursEnseignes;
  int adminIdAdmin;
  int utilisateursIdUtilisateurs;

  Professeur(
    this.idProf,
    this.domaine,
    this.grade,
    this.coursEnseignes,
    this.adminIdAdmin,
    this.utilisateursIdUtilisateurs,
  );

  factory Professeur.fromJson(Map<String, dynamic> json) {
    return Professeur(
      json['idProf'],
      json['domaine'],
      json['grade'],
      json['coursEnseignes'],
      json['Admin_idAdmin'],
      json['Utilisateurs_idUtilisateurs'],
    );
  }
}
