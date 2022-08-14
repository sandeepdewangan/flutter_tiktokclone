import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/view/add_video_page.dart';
import 'package:tiktok_clone/view/home_page.dart';
import 'package:tiktok_clone/view/login_page.dart';
import 'package:tiktok_clone/view/video_confirm_page.dart';
import './constants.dart';
import './controller/auth_controller.dart';
import './view/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // First the auth controller will be initialized.
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/add-video', page: () => const AddVideoPage()),
        GetPage(name: '/video-confirm', page: () => VideoConfirmPage()),
      ],
    );
  }
}
