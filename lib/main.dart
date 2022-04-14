import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/PickImage.dart';
import 'View/HomScreen.dart';
import 'View/SignIn.dart';
import 'View/SignUp.dart';
import 'View/reset_password.dart';
import 'View/splash.dart';
import 'View/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';

import 'firebase_auth.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translate', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetImage()),
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
      ],
      child:    MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/',
    routes: {
    '/': (context) => Splash(),
    '/sign_in': (context) => SignIn(),
    '/sign_up': (context) => SignUp(),
    '/home_screen': (context) => Home(),
    '/verification': (context) => Verification(),
    '/reset_password': (context) => ResetPasswordScreen(),
    }
    )
  );
  }
}