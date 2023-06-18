import 'package:brainhive/Providers/user_provider.dart';
import 'package:brainhive/Screens/add_question_screen.dart';
import 'package:brainhive/Screens/feed_screen.dart';
import 'package:brainhive/Screens/login_screen.dart';
import 'package:brainhive/Screens/main_screen.dart';
import 'package:brainhive/Screens/signup_screen.dart';
import 'package:brainhive/Screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) =>UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomeScreen.id : (context) => WelcomeScreen(),
          LoginScreen.id :(context) => LoginScreen(),
          SignUpScreen.id : (context) => SignUpScreen(),
          MainScreen.id : (context) => MainScreen(),
          AddQuestionScreen.id: (context) => AddQuestionScreen(),
          FeedScreen.id: (context) => FeedScreen(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return WelcomeScreen();
              }
              else if (snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightBlue,
                ),
              );
            }
            return WelcomeScreen();
          },
        )
      ),
    );
  }
}

