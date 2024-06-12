import 'dart:convert';

import 'package:flutter/material.dart';
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

  @override
  void initState() {
    _retrieveNotes();
    super.initState();
  }

  _retrieveNotes() {
    notes = [];
    client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        notes = list.map((model) => Note.fromMap(model)).toList();
      });
    });
  }
  void _addNote() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notes List"),
          backgroundColor: Colors.black26,
        ),
        body: const Column(
          children: [
            Text("Notes!!!"),
            Text("Notes List Page"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
