import 'dart:convert';
//import 'package:cahiert/Classes/etudiant.dart';
//import 'package:dio/dio.dart' as dio;
import 'package:cahiert/Classes/etudiant.dart';
import 'package:cahiert/Classes/prof.dart';
import 'package:cahiert/Classes/session.dart' as session;
import 'package:http/http.dart' as http;

class WsManager {
  var base_url = 'http://127.0.0.1:8000/api/';

  //ETUDIANT
  Future<String> createEtudiant(etudiant) async {
    final url = base_url + 'etudiants';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(etudiant),
      );
      if (response.statusCode == 200) {
        // Convertir le résultat en chaîne
        return 'Succès : ${jsonDecode(response.body)}';
      } else {
        print('statusCode : ${response.statusCode}');
        print('réponse : ${response}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //classe
  Future<String> createClasse(classe) async {
    final url = base_url + 'classes';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(classe),
      );
      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('réponse : ${response}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //GETclasse
  getClasses() async {
    var url = base_url + 'classes';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(utf8.decode(response.bodyBytes));
    print(body);

    if (body != null) {
      // =body['data'];
      return body;
    } else {
      print(body);
    }
  }

  //Cours

  createCours(cours) async {
    try {
      final url = base_url + 'cours';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cours),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //FILIERE
  createFiliere(filiere) async {
    try {
      final url = base_url + 'filieres';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(filiere),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //SEANCE
  createSeance(seance) async {
    try {
      final url = base_url + 'seances';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(seance),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //Fiche
  createFiche(fiche) async {
    try {
      final url = base_url + 'fichesuivicours';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(fiche),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //GETFILIERE

  getFiliere() async {
    var url = base_url + 'filieres';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(utf8.decode(response.bodyBytes));
    print(body);

    if (body != null) {
      // =body['data'];
      return body;
    } else {
      print(body);
    }
  }

  //GETFICHE

  getFiche() async {
    var url = base_url + 'fichesuivicours';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(utf8.decode(response.bodyBytes));
    print(body);

    if (body != null) {
      // =body['data'];
      return body;
    } else {
      print(body);
    }
  }

  //GETPROF
  getProf() async {
    var url = base_url + 'professeurs';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(utf8.decode(response.bodyBytes));
    print(body);

    if (body != null) {
      // =body['data'];
      return body;
    } else {
      print(body);
    }
  }

  //GETCOURS
  getCours() async {
    var url = base_url + 'cours';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(utf8.decode(response.bodyBytes));
    print(body);

    if (body != null) {
      // =body['data'];
      return body;
    } else {
      print(body);
    }
  }

  //GETCOURS
  getSeance() async {
    var url = base_url + 'seances';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(utf8.decode(response.bodyBytes));
    print(body);

    if (body != null) {
      // =body['data'];
      return body;
    } else {
      print(body);
    }
  }

  //PROFESSEUR
  Future<String> createProfesseur(professeur) async {
    final url = base_url + 'professeurs';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(professeur),
      );
      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('réponse : ${response}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //RESPONSABLE

  createResponsable(responsable) async {
    try {
      final url = base_url + 'responsables';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(responsable),
      );

      print('statusCode: ${response.statusCode}');
      print('body: ${response.body}');

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('Erreur lors de la requête : ${response.statusCode}');
        print('Corps de la réponse : ${response.body}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  getUserId() async {
    return await session.getUserId();
  }

  getAdminId() async {
    return await session.getAdminId();
  }

  getRespId() async {
    return await session.getRespId();
  }

  getProfId() async {
    return await session.getProfId();
  }

  getClasseId() async {
    return await session.getClasseId();
  }

  getIdFiliere() async {
    return await session.getIdFiliere();
  }

  getIdSeance() async {
    return await session.getIdSeance();
  }

  getIdCours() async {
    return await session.getIdCours();
  }

  //GETETUDIANTS
  getEtudiant() async {
    try {
      final url = '${base_url}etudiants';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable serverResponse = jsonDecode(response.body);
        print(serverResponse);
        //  List<Dossier>.from(json['dossiers'].map((x) => Dossier.fromJson(x))),

        List<Etudiant> etudiants =
            List<Etudiant>.from(serverResponse.map((etudiant) {
          return Etudiant.fromJson(etudiant);
        }));
        print(etudiants);
        return etudiants;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //CONNEXION UTILISATEURS
  Future<String> checkLogin(String username, String password) async {
    try {
      final url = base_url + 'users/login';
      var body = {
        'email': username,
        'password': password,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        int userId = serverResponse['idUtilisateurs'];
        String profile = serverResponse['profile'];
        session.setUserId(userId);
        session.setUserProfile(profile);

        if (profile == 'Admin') {
          print(serverResponse['admins']);
          int idAdmin = serverResponse['admins'][0]['idAdmin'];
          session.setAdminId(idAdmin);
          return 'Admin';
        } else if (profile == 'ResponsablePedagogique') {
          print(serverResponse['responsable_pedagogiques']);
          int idResp = serverResponse['responsable_pedagogiques'][0]['idResp'];
          session.setRespId(idResp);
          return 'ResponsablePedagogique';
        } else if (profile == 'Professeur') {
          print(serverResponse['professeurs']);
          int idProf = serverResponse['professeurs'][0]['idProf'];
          session.setProfId(idProf);
          return 'Professeur';
        } else if (profile == 'Etudiant') {
          return 'Etudiant';
        } else {
          return 'Type d\'utilisateur inconnu';
        }
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  //RECUPERATION professeurs

  getProfesseur() async {
    try {
      final url = '${base_url}professeurs';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Iterable serverResponse = jsonDecode(response.body);
        print(serverResponse);
        //  List<Dossier>.from(json['dossiers'].map((x) => Dossier.fromJson(x))),

        List<Professeur> professeurs =
            List<Professeur>.from(serverResponse.map((professeur) {
          return Professeur.fromJson(professeur);
        }));
        print(professeurs);
        return professeurs;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }
}
