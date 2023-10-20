import 'package:cahiert/Responsable/CreerCours.dart';
import 'package:cahiert/Responsable/ListeCours.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CoursHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class CoursHome extends StatefulWidget {
  const CoursHome({Key? key}) : super(key: key);

  @override
  _CoursHomeState createState() => _CoursHomeState();
}

class _CoursHomeState extends State<CoursHome> {
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
          CreerCours(),
          ListeCours(),
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
            label: 'Créer cours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste cours',
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
