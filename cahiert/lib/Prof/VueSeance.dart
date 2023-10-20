import 'package:cahiert/Prof/CahierTexte.dart';
import 'package:cahiert/Prof/CreerSeance.dart';
import 'package:cahiert/Prof/ListePresence.dart';
import 'package:cahiert/Prof/VoirSeance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: VueSeance(),
    debugShowCheckedModeBanner: false,
  ));
}

class VueSeance extends StatefulWidget {
  const VueSeance({Key? key}) : super(key: key);

  @override
  _VueSeanceState createState() => _VueSeanceState();
}

class _VueSeanceState extends State<VueSeance> {
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
          CahierTextePage(),
          ListePresence(),
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
            label: 'Cahier texte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste présence',
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
