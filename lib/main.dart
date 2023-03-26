import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/view_model/state/auth_provider.dart';
import 'package:gsc/view_model/state/composition_provider.dart';
import 'package:gsc/view_model/state/dictionary_provider.dart';
import 'package:gsc/view_model/state/home_provider.dart';
import 'package:gsc/view_model/state/human_body_provider.dart';
import 'package:gsc/view_model/state/main_provider.dart';
import 'package:gsc/views/auth_accounts.dart';
import 'package:gsc/views/human_body/human_body_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
        ),
        ChangeNotifierProvider<CompositionProvider>(
          create: (context) => CompositionProvider(),
        ),
        ChangeNotifierProvider<DictionaryProvider>(
          create: (context) => DictionaryProvider(),
        ),
        ChangeNotifierProvider<HumanBodyProvider>(
          create: (context) => HumanBodyProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MyColors.primarymaterial,
        ),

        // primarySwatch: Colors.blue,
      ),
      home: const AuthAccount(),
    );
  }
}
