import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phaarmy_user/app/app.dart';
import 'package:phaarmy_user/bootstrap.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await  Firebase.initializeApp();
  bootstrap(() => const App());
}
