import 'package:flutter/material.dart';
import 'package:ombre_clone_flutter/search.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int selected_index) {
    setState(() {
      _selectedIndex = selected_index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        cursorColor: Color(0xFFDA5C86),
        scaffoldBackgroundColor: Color(0xFF263240),
        primaryColor: Color(0xFF263240),
        accentColor: Color(0xFF263240),
      ),
      home: Scaffold(
        body: (_selectedIndex == 1) ? SearchRoute() : Center(child:Text('To be developed')),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('HOME'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('SEARCH'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text('INTERESTED'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('PROFILE'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          elevation: 5,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
