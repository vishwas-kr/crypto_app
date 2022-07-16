import 'package:crypto/app/routes/app_routes.dart';
import 'package:crypto/screens/home/home.dart';
import 'package:crypto/screens/splash/splash_screen.dart';
import 'package:crypto/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/notifiers/app_notifiers.dart';
import 'screens/login/signIn.dart';
import 'services/local_notification_service.dart';


Future<void> backgroundHandler(RemoteMessage message) async {
  	print(message.data.toString());
 	print(message.notification!.title);
	}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => AppNotifiers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Montreal",
        ),
        home: const AuthWrapper(),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const SignInScreen();
  }
}
