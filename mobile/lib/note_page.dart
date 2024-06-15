// import 'package:flutter/material.dart';

// class NotePageWidget extends StatelessWidget {
//   final String noteId;

//   const NotePageWidget({super.key, required this.noteId});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Note Page"),
//       ),
//       body: Center(
//         child: Text("Note ID: $noteId"),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mobile/note.dart';

class NotePageWidget extends StatefulWidget {
  final String noteId;

  const NotePageWidget({super.key, required this.noteId});

  @override
  State<NotePageWidget> createState() => _NotePageWidgetState();
}

class _NotePageWidgetState extends State<NotePageWidget> {
  Client client = http.Client();
  List<Note> notes = [];
  Map<String, dynamic> neededNote = {};

  Future<void> fetchNotes() async {
    print('1');
    final response = await http.get(
      Uri.parse('http://192.168.31.42:8000/notes/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      setState(() {
        notes = data.map((object) => Note.fromJson(object)).toList();
        neededNote = notes
            .where((note) => note.id == int.parse(widget.noteId))
            .first
            .toMap();
        print('2');
      });
    } else {
      throw Exception("Failed to load notes");
    }
  }

  @override
  void initState() {
    print('3');
    fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notes List"),
          backgroundColor: Colors.black26,
        ),
        body: neededNote.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final note = neededNote;
                  return Card(
                    color: Colors.black26,
                    child: ListTile(
                      title: Text(note['title']),
                      subtitle: Text(note['body']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
