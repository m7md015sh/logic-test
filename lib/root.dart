import 'package:flutter/material.dart';

import 'screens/multi_image_selector.dart';
import 'screens/multi_selection.dart';
import 'screens/toggle_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _controller;
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    MultiImageSelector(),
    TaskScreen(),
    ToggleSelection(),
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            // _controller.jumpToPage(_currentIndex);
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            _controller.jumpToPage(index);
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.toggle_on), label: 'Toggle'),
        ],
      ),
    );
  }
}
