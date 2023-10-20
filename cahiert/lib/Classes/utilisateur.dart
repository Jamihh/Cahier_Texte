import 'package:cahiert/Classes/admin.dart';
import 'package:cahiert/Classes/etudiant.dart';
import 'package:cahiert/Classes/filiere.dart';
import 'package:cahiert/Classes/liste.dart';
import 'package:cahiert/Classes/prof.dart';
import 'package:cahiert/Classes/responsablepedagogique.dart';
import 'package:flutter/material.dart';

class Utilisateur {
  int? idUtilisateurs;
  String nom;
  String prenom;
  String email;
  String telephone;
  String adresse;
  String mdp;
  String genre;
  String profile;

  Utilisateur(
    this.idUtilisateurs,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
    this.adresse,
    this.mdp,
    this.genre,
    this.profile,
    this.admins,
    this.responsable_pedagogiques,
    this.professeurs,
    this.etudiants,
  );

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      json['idUtilisateurs'],
      json['nom'],
      json['prenom'],
      json['email'],
      json['telephone'],
      json['adresse'],
      json['mdp'],
      json['genre'],
      json['profile'],
      List<Admin>.from(json['admins'].map((x) => Admin.fromJson(x))),
      List<ResponsablePedagogique>.from(json['responsable_pedagogiques']
          .map((x) => ResponsablePedagogique.fromJson(x))),
      List<Professeur>.from(
          json['professeurs'].map((x) => Professeur.fromJson(x))),
      List<Etudiant>.from(json['Etudiant'].map((x) => Etudiant.fromJson(x))),
    );
  }

  List<Admin>? admins;
  List<Etudiant>? etudiants;
  List<Professeur>? professeurs;
  List<ResponsablePedagogique>? responsable_pedagogiques;
}
