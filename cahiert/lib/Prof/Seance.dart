import 'package:cahiert/Prof/CreerSeance.dart';
import 'package:cahiert/Prof/VoirSeance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Seance(),
    debugShowCheckedModeBanner: false,
  ));
}

class Seance extends StatefulWidget {
  const Seance({Key? key}) : super(key: key);

  @override
  _SeanceState createState() => _SeanceState();
}

class _SeanceState extends State<Seance> {
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
          CreerSeance(),
          VoirSeance(),
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
            label: 'Créer séance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Voir séance',
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
