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
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            7,
            (index) => GridTile(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Grid ${index + 1}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
