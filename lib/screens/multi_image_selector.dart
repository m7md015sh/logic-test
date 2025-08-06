import 'package:flutter/material.dart';

class MultiImageSelector extends StatefulWidget {
  const MultiImageSelector({super.key});

  @override
  State<MultiImageSelector> createState() => _MultiImageSelectorState();
}

class _MultiImageSelectorState extends State<MultiImageSelector> {
  int _selectedIndex = -1;
  List<String> images = List.generate(
    6,
    (index) => 'assets/images/${'img${index + 1}'}.avif',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  debugPrint(_selectedIndex.toString());
                });
              },
              child: _selectedIndex == index
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                      child: Image(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image(image: AssetImage(images[index]), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
