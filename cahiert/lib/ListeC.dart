import 'package:cahiert/Admin/ListeCompte.dart';
//import 'package:cahiert/Admin/ListeFiliere.dart';
//import 'package:cahiert/Admin/filiere.dart';
import 'package:cahiert/creerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ListeC(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListeC extends StatefulWidget {
  const ListeC({Key? key}) : super(key: key);

  @override
  _ListeCState createState() => _ListeCState();
}

class _ListeCState extends State<ListeC> {
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
          creerPage(),
          ListeCompte(),
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
            label: 'Créer comptes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste comptes',
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
