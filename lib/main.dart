import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:sanalira/authenticationService.dart';
import 'firebase_options.dart';
import 'package:sanalira/screens/loginScreen.dart';
import 'package:sanalira/screens/moneyTransferScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( // implemented Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown] // to portrait vertical
  );
  runApp( SanaLiraDemoApp());
}

class SanaLiraDemoApp extends StatelessWidget {
  const SanaLiraDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
    Provider<AuthenticationService>(
    create: (_) => AuthenticationService(FirebaseAuth.instance),
    ),
          StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
          ),
        ],
      child: MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return moneyTransferScreen();
    }
    return LoginScreen();
  }
}
