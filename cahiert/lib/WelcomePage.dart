import 'package:cahiert/Classes/wsManager.dart';
import 'package:cahiert/HomePage/EtuHomePage.dart';
import 'package:cahiert/HomePage/PersoHomePage.dart';
import 'package:cahiert/HomePage/ProfHomePage.dart';
import 'package:flutter/material.dart';
import 'package:cahiert/HomePage/AdminHomePage.dart';

void main() {
  runApp(const MaterialApp(
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  WsManager wsManager = new WsManager();

  bool _obscurePassword = true;

  void login() {
    bool isValidStudent(String email, String password) {
      return true;
    }

    bool isValidTeacher(String email, String password) {
      return true;
    }

    bool isValidAdmin(String email, String password) {
      return true;
    }

    bool isValidResponsable(String email, String password) {
      return true;
    }

    void showErrorMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    // Ajoutez ici la logique de connexion
    // Vous pouvez utiliser les fonctions isValid* pour vérifier le type d'utilisateur
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/5.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logim.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 30),
                const Text(
                  'CONNEXION',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 2, 12),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          icon: Icon(Icons.lock),
                          // Ajoutez le suffixIcon pour l'icône de visibilité/masquage
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color.fromARGB(255, 45, 169, 247),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          // Naviguez vers la page principale (main.dart) ou toute autre page souhaitée.
                          //Navigator.of(context).pushNamed('/per');
                          var response = await wsManager.checkLogin(
                              _emailController.text, _passwordController.text);
                          print("réponse:  + ${response}");
                          if (response == 'Admin') {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AdminHomePage()),
                            );
                          } else if (response == 'Etudiant') {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EtuHomePage()),
                            );
                          } else if (response == 'Professeur') {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ProfHomePage()),
                            );
                          } else if (response == 'ResponsablePedagogique') {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => PersoHomePage()),
                            );
                          } else {
                            print('Cet utilisateur n\'existe pas');
                          }
                          //checkLogin(
                          //   _emailController.text, _passwordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 78, 160, 254),
                        ),
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(email, password) async {
    print('email: ${email}, password: ${password}');

    var response = await wsManager.checkLogin(email, password);
    print('réponse: ' + response);
    if (response == 'Admin') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AdminHomePage()),
      );
    } else if (response == 'Etudiant') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EtuHomePage()),
      );
    } else if (response == 'Professeur') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfHomePage()),
      );
    } else if (response == 'ResponsablePedagogique') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PersoHomePage()),
      );
    } else {
      print('Cet utilisateur n\'existe pas');
    }
  }
}
