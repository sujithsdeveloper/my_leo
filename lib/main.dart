import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_leo/firebase_options.dart';
import 'package:my_leo/view/mainScreen/mainscreen.dart';
import 'package:my_leo/view/registration_screens/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final user=FirebaseAuth.instance.currentUser;
   MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: user != null ? Mainscreen():LoginScreen()

      
    );
  }
}
