import 'package:brainhive/Providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brainhive/Models/user.dart';

import '../Components/Bottomnavigationbar.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }
  
  addData() async {
    UserProvider _userProvider = Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavBarFb2(),
      ),
    );
  }
}
