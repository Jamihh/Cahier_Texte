import 'package:flutter_session_manager/flutter_session_manager.dart';

var session = SessionManager();
//userid
void setUserId(int userId) async {
  await session.set('user_id', userId);
}

getUserId() async {
  int userId = await session.get('user_id');
  return userId;
}

//userprofile
void setUserProfile(String userProfile) async {
  await session.set('user_profile', userProfile);
}

getUserProfile() async {
  String userProfile = await session.get('user_Profile');
  return userProfile;
}

//filiere
void setIdFiliere(int idFiliere) async {
  await session.set('idFiliere', idFiliere);
}

getIdFiliere() async {
  int idFiliere = await session.get('idFiliere');
  return idFiliere;
}

//cours
void setIdCours(int idCours) async {
  await session.set('idCours', idCours);
}

getIdCours() async {
  int idCours = await session.get('idCours');
  return idCours;
}

//admin

void setAdminId(int idAdmin) async {
  await session.set('idAdmin', idAdmin);
}

getAdminId() async {
  int idAdmin = await session.get('idAdmin');
  return idAdmin;
}

//Responsable
void setRespId(int idResp) async {
  await session.set('idResp', idResp);
}

getRespId() async {
  int idResp = await session.get('idResp');
  return idResp;
}

//Prof
void setProfId(int idProf) async {
  await session.set('idProf', idProf);
}

getProfId() async {
  int idProf = await session.get('idProf');
  return idProf;
}

//Etudiant
void setEtuId(int idEtu) async {
  await session.set('idEtu', idEtu);
}

getEtuId() async {
  int idEtu = await session.get('idEtu');
  return idEtu;
}

//Classe
void setClasseId(int idClasse) async {
  await session.set('idClasse', idClasse);
}

getClasseId() async {
  int idClasse = await session.get('idClasse');
  return idClasse;
}

//Seance
void setIdSeance(int idSeance) async {
  await session.set('idSeance', idSeance);
}

getIdSeance() async {
  int idSeance = await session.get('idSeance');
  return idSeance;
}

//Fiche
void setIdFiche(int idFiche) async {
  await session.set('idFiche', idFiche);
}

getIdFiche() async {
  int idFiche = await session.get('idFiche');
  return idFiche;
}
