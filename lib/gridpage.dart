import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<String> imagePaths = [
     "assets/amy-cooper-sing01.gif",
     "assets/baking.gif",
     "assets/cycling.gif",
     "assets/photography.gif",
     "assets/travelling.gif",
     "assets/yoga.gif"
     
    ];

    return Scaffold(  appBar: AppBar(
        title: Text(
          "Explore....",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 6, 62, 100),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
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
              imagePaths.length,
              (index) => GridItem(
                index: index,
                imagePath: imagePaths[index], 
                onTap: () {
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
  final String imagePath; 
  final VoidCallback onTap;

  const GridItem({
    Key? key,
    required this.index,
    required this.imagePath, 
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
            children: [
              Image.asset(imagePath), 
            ],
          ),
        ),
      ),
    );
  }
}


