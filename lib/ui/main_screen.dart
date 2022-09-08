import 'package:climb_gesh_on_flutter_demo/ui/weather_screen/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'guidbook-screen/guidbook_screen.dart';
import 'profile_and_links/profile_and_links_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = [
    GuidBookScreen(),
    WeatherScreenWidget(),
    ProfileAndLinksWidget(),
  ];
  static const String prefSelectedIndexKey = 'selectedIndex';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentIndex();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    saveCurrentIndex();
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
  }

  void getCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      setState(() {
        final index = prefs.getInt(prefSelectedIndexKey);
        if (index != null) {
          _selectedIndex = index;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Гайдбук'),
          BottomNavigationBarItem(
              icon: Icon(Icons.thermostat), label: 'Погода'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Контакты'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(index: _selectedIndex, children: pageList),
    );
  }
}
