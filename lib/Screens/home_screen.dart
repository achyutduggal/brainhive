import 'package:brainhive/Components/Card.dart';
import 'package:brainhive/Components/Topbar.dart';
import 'package:brainhive/Screens/add_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TopBarFb4(title: 'Welcome Back', upperTitle: 'Achyut', onTapMenu: () {  },),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 180.0,
              ),
              Center(
                child: Text(
                  'Study Together,Learn Better',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 22.0),
                ),
              ),
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: InteractiveTile(
                  text: "Ask Question",
                  imageUrl:
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
                  subtitle: "Get your doubts cleared",
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(AddQuestionScreen.id);
                  },
                ),
              ),
              const SizedBox(height: 15.0,),
              Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: InteractiveTile(
                  text: "Answer a Question",
                  imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Social_friends_re_7uaa%201.png?alt=media&token=25201ff9-7b37-4f0d-ac86-66d98283d4c4",
                  subtitle: "And win points to unlock Answers",
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
