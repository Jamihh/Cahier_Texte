import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cour {
  int idCours;
  String intitule;
  String duree;
  int professeurIdProf;
  int responsablePedagogiqueIdResp;
  int classeIdClasse;

  Cour(
    this.idCours,
    this.intitule,
    this.duree,
    this.professeurIdProf,
    this.responsablePedagogiqueIdResp,
    this.classeIdClasse,
  );

  factory Cour.fromJson(Map<String, dynamic> json) {
    return Cour(
      json['idCours'],
      json['intitulé'],
      json['duree'],
      json['Professeur_idProf'],
      json['Responsable pedagogique_idResp'],
      json['Classe_idClasse'],
    );
  }
}
