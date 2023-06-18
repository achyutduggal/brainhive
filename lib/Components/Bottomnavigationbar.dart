import 'package:brainhive/Screens/feed_screen.dart';
import 'package:flutter/material.dart';
import '../Screens/search_screen.dart';
import '../Screens/home_screen.dart';

class BottomNavBarFb2 extends StatefulWidget {
  const BottomNavBarFb2({Key? key}) : super(key: key);

  @override
  _BottomNavBarFb2State createState() => _BottomNavBarFb2State();
}

class _BottomNavBarFb2State extends State<BottomNavBarFb2> {
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    FeedScreen(),
    CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Color(0xff3f37c9),),
            label: "Home",
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,color: Color(0xff3f37c9),),
            label: "Search",
            backgroundColor:Colors.white,
          ),
       BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined,color: Color(0xff3f37c9),),
            label: "Cart",
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined,color: Color(0xff3f37c9),),
            label: "Calendar",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
        required this.text,
        required this.icon,
        required this.selected,
        required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xffAA355D);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black54,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected
                  ? primaryColor
                  : Colors.black54,
        )
        )],
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Calendar Screen',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
