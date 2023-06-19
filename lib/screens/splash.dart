
import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';
import 'package:loginapp/screens/home.dart';
import 'package:loginapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   checkUserLoggedIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255,20,20,20),
      body: Center(child: Image.asset('assets/images/splashgif.gif'),),);
  }
  Future<void>gotologin()async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
  }

    Future<void>checkUserLoggedIn()async{
      final _sharedprefs = await SharedPreferences.getInstance();
      final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
      if(_userLoggedIn == null || _userLoggedIn==false){
          gotologin();
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>HomeScreen()));
      }
    }   
}