import 'package:brainhive/Components/Searchbar.dart';
import 'package:flutter/material.dart';

import '../Components/Questioncard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          const SizedBox(height: 40.0,),
          const Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: SearchBar(searchController: null, hintText: 'What\u0027s on your mind ?' , ),
          ),
          const SizedBox(height: 35.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NoteWidget(
                subject: 'Flutter Widgets',
                question: 'How do I create a custom widget in Flutter?',
                dateTime: DateTime.now(),
                onDelete: () {
                  // Handle delete action here
                },
              ),
              NoteWidget(
                subject: 'Flutter Widgets',
                question: 'How do I create a custom widget in Flutter?',
                dateTime: DateTime.now(),
                onDelete: () {
                  // Handle delete action here
                },
              ),
              NoteWidget(
                subject: 'Flutter Widgets',
                question: 'How do I create a custom widget in Flutter?',
                dateTime: DateTime.now(),
                onDelete: () {
                  // Handle delete action here
                },
              ),
              NoteWidget(
                subject: 'Flutter Widgets',
                question: 'How do I create a custom widget in Flutter?',
                dateTime: DateTime.now(),
                onDelete: () {
                  // Handle delete action here
                },
              ),





            ],
          ),
        ],
      ),
    );
  }
}
