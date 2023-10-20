import 'package:cahiert/Responsable/ListeClasse.dart';
import 'package:cahiert/Responsable/creerClasse.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ClassHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class ClassHome extends StatefulWidget {
  const ClassHome({Key? key}) : super(key: key);

  @override
  _ClassHomeState createState() => _ClassHomeState();
}

class _ClassHomeState extends State<ClassHome> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          CreerClasse(),
          ListeClasse(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Créer Classe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste Classes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }
}
