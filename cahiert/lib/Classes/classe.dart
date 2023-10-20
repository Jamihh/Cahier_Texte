import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Classe {
  int idClasse;
  String nomClasse;
  String nbrEtu;
  int responsable_pedagogique_idResp;
  int filiere_idFiliere;

  Classe(
    this.idClasse,
    this.nomClasse,
    this.nbrEtu,
    this.responsable_pedagogique_idResp,
    this.filiere_idFiliere,
  );

  factory Classe.fromJson(Map<String, dynamic> json) {
    return Classe(
      json['idClasse'],
      json['nomClasse'],
      json['nbrEtu'],
      json['Responsable pedagogique_idResp'],
      json['filière_idFiliere'],
    );
  }
}
