import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'hobby.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WhatsYourHobby()),
        );
        
        return userCredential;
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
    return null;
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      print('User logged in: ${userCredential.user!.uid}');
      
    
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WhatsYourHobby()),
      );
    } catch (error) {
      print('Error signing in with email and password: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Untitled design (1).png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            left: 20,
            right: 20,
            child: Column(
              children: [
                
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
             
                ElevatedButton(
                  onPressed: () => signInWithEmailAndPassword(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 204, 137),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              
                OutlinedButton.icon(
                  onPressed: signInWithGoogle,
                  icon: const Icon(Icons.login, color: Color.fromARGB(255, 19, 180, 119)),
                  label: const Text(
                    'Sign in with Google',
                    style: TextStyle(color: Color.fromARGB(255, 22, 173, 128)),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color.fromARGB(255, 20, 177, 117)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
