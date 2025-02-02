import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'learnScreen.dart';
import 'playScreen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// Current tab: 0=Learn, 1=Home, 2=Play
  int _selectedIndex = 1;

  /// The user's global balance, shown in the top-right of the AppBar
  int _balance = 100;

  final List<String> _tabTitles = ['Learn', 'Home', 'Play'];
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    // Build the 3 main screens. Pass the balance where needed:
    _screens = [
      // Learn
      LearnScreen(
        currentBalance: _balance,
        onBalanceChanged: (newBalance) {
          setState(() => _balance = newBalance);
        },
      ),
      // Home
      HomeScreen(),
      // Play
      PlayScreen(
        currentBalance: _balance,
        onBalanceChanged: (newBalance) {
          setState(() => _balance = newBalance);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ONE AppBar, always visible
      appBar: AppBar(
        title: Row(
          children: [
            Text(_tabTitles[_selectedIndex]),
            Spacer(),
            Text('Coins: $_balance'),
          ],
        ),
      ),

      // Body: Show the appropriate screen for the selected tab.
      // Using IndexedStack keeps each screen's state alive.
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Play'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
