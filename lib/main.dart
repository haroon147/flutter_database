import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/FirebaseAllServices/checkUser.dart';
import 'package:flutter_database/SharedPrefMaster/PrefMaster.dart';
import 'package:flutter_database/SharedPrefMaster/sharedClass.dart';
import 'CRUD using SQlite/SQLiteHome.dart';
import 'MidsSolution/midSol.dart';
import 'firebase_options.dart';

void main() async{
  //calling in main because we don't want to call everywhere in the program
  // WidgetsFlutterBinding.ensureInitialized(); // Ensures the binding is initialized
  // await MyPreference.init();
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Myprefences.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckUser(),
    );
  }
}

