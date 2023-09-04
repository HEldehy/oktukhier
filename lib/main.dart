import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octukheir/cubit/cubit.dart';
import 'package:octukheir/modules/pages/homepage.dart';
import 'modules/pages/login_page.dart';
import 'modules/pages/on_boarding_page.dart';
import 'modules/pages/register_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  static String id='LoginPage';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )
    );
    return BlocProvider(
      create: (BuildContext context)=>OctuCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '8Kheir',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          OnBoardingPage.id:(context)=>const OnBoardingPage(),
          LoginPage.id:(context)=>const LoginPage(),
          RegisterPage.id:(context)=>const RegisterPage(),
          HomePage.id:(context)=> HomePage()

        },
        initialRoute: OnBoardingPage.id,
      ),
    );
  }
}

