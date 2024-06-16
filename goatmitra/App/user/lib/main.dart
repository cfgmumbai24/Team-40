import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:user/Models/constants.dart';
import 'package:user/firebase_options.dart';
import 'package:user/Models/provider/vaccinaProvider.dart';
import 'package:user/view/Auth/signin.dart';
import 'package:user/view/pages/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return HomePage();
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                        //color: primaryColor,
                        ),
                  );
                }
                return const Loginscreen();
              }))),
    );
  }
}
