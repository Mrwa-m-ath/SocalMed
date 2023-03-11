import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Cubit/MyCubit.dart';
import 'package:socialapp/Cubit/MyStat.dart';

import 'Pages/LogIn.dart';

//android package name =>android>app>src>main>androidMainFast = package="com.example.socialapp">
//
//
//
//Debug signing certificate SHA-1 (optional)       =>android=>gradlew.bet(بدوس دبل يمين بختار open in terminal) =>./gradlew signingReport./gradlew signingReport
// igningReport

/// انقل الملف ع app
///
/// ///
/// IOS====>FIND FILE =PRODUCT_BUNDLE_IDENTIFIER
/// ID=?serchgoogle=?disney app store

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}
//Firebase
// FirebaseAuth

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        builder: (context, state) => MaterialApp(
          home: LogIn(),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
