import 'package:daily_feels/gridpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WhatsYourHobby extends StatefulWidget {
  const WhatsYourHobby({Key? key}) : super(key: key);

  @override
  State<WhatsYourHobby> createState() => _WhatsYourHobbyState();
}

class _WhatsYourHobbyState extends State<WhatsYourHobby> {
  String userId = '';
  String hobby = '';

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    try {
      await firestore.collection('hobbies').add({
        'userId': userId,
        'hobby': hobby,
        'timestamp': Timestamp.now(),
      });
      
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved successfully'),
        ),
        
      );
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GridPage()),
        );
    } catch (error) {
      print('Error saving data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/whatsyourhobby.gif',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter User ID',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userId = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Hobby',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      hobby = value;
                    });
                  },
                ),
              ),
              ElevatedButton( style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 18, 63, 99),
  ),
                onPressed: saveData,
                child: Text('LETS GO!', style: TextStyle(color: Color.fromARGB(234, 255, 254, 254)),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
