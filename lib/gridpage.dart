import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 71, 124),
              Color.fromARGB(255, 79, 218, 183)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              8,
              (index) => GridItem(
                index: index,
                onTap: () {
                  // Handle click action here
                  print('Grid item $index clicked');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const GridItem({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [ Image.asset("assets/cycling.gif")
          ]),
        ),
      ),
    );
  }
}
