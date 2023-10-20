import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: VoirListeP(),
    debugShowCheckedModeBanner: false,
  ));
}

class VoirListeP extends StatefulWidget {
  const VoirListeP({Key? key}) : super(key: key);

  @override
  _VoirListePState createState() => _VoirListePState();
}

class _VoirListePState extends State<VoirListeP> {
  late Future<List<Map<String, dynamic>>> _classes;

  @override
  void initState() {
    super.initState();
    _classes = fetchClasses();
  }

  Future<List<Map<String, dynamic>>> fetchClasses() async {
    final response =
        await http.get(Uri.parse('http://192.168.5.148:8000/api/classes'));

    if (response.statusCode == 200) {
      // Si la requête réussit, analysez la réponse JSON
      final List<dynamic> classes = jsonDecode(response.body);
      return classes.cast<Map<String, dynamic>>();
    } else {
      // Si la requête échoue, lancez une exception
      throw Exception('Failed to load classes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voir la liste de chaque classe"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _classes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Aucune classe trouvée.');
          } else {
            return DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nom de la classe')),
                DataColumn(label: Text('Filière')),
              ],
              rows: snapshot.data!.map((classData) {
                return DataRow(cells: [
                  DataCell(Text(classData['id'].toString())),
                  DataCell(Text(classData['className'])),
                  DataCell(Text(classData['filiere'])),
                ]);
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
