import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'note.dart';

class NotesListPageWidget extends StatefulWidget {
  const NotesListPageWidget({super.key});

  @override
  State<NotesListPageWidget> createState() => _NotesListPageWidgetState();
}

class _NotesListPageWidgetState extends State<NotesListPageWidget> {
  Client client = http.Client();
  List<Note> notes = [];

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
        body: notes.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Card(
                    color: Colors.black26,
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.body),
                      onTap: () => context.go('/notes/${note.id}'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
