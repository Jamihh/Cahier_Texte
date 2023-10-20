import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: VoirCahier(),
    debugShowCheckedModeBanner: false,
  ));
}

class VoirCahier extends StatefulWidget {
  const VoirCahier({Key? key}) : super(key: key);

  @override
  _VoirCahierState createState() => _VoirCahierState();
}

class _VoirCahierState extends State<VoirCahier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contenu du cahier"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
