import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app/presentation/pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ProviderScope(
        child: MyApp(),
      )
  );
}

class MyApp extends ConsumerWidget {
   MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: FutureBuilder(
        future: _firebaseApp,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
                return const Text("Something wrong with firebase");
          }else if(snapshot.hasData){
            return const LoginPage();
          }else{
            return const CircularProgressIndicator(color: Colors.blue);
          }
        },
      ),
    );
  }
}
