import 'package:booking_flights/core/data/repositories/shared_prefernce_repo.dart';
import 'package:booking_flights/my_app/my_app.dart';
import 'package:booking_flights/ui/views/login_view/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Firebase.initializeApp();
  //*  -- Add To Dependency Injection --
  Get.put(SharedPreferenceRepositories());
  Get.put(LoginController());
  runApp(const MyApp());  
}
