import 'package:cahiert/Admin/ListeFiliere.dart';
import 'package:cahiert/Admin/filiere.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FiliereHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class FiliereHome extends StatefulWidget {
  const FiliereHome({Key? key}) : super(key: key);

  @override
  _FiliereHomeState createState() => _FiliereHomeState();
}

class _FiliereHomeState extends State<FiliereHome> {
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
          filiere(),
          ListeFiliere(),
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
            label: 'Créer filière',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Liste filière',
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
