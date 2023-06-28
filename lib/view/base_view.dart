import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:nursery_driver/view/history/view.dart';
import 'account/view.dart';
import 'home/view.dart';


class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),//
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        iconSize: 24,
        selectedItemColor: Theme
            .of(context)
            .colorScheme
            .secondary,
        type: BottomNavigationBarType.fixed,
        //showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        //showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FlutterRemix.home_2_line),
              label: "Home",
              backgroundColor: Colors.green
          ),

          // BottomNavigationBarItem(
          //     icon: Icon(Icons.receipt_outlined),
          //     label: "Rerun",
          //     backgroundColor: Colors.green
          // ),

          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: "History",
              backgroundColor: Colors.green
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
              backgroundColor: Colors.green
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],

    );
  }
}