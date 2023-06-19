import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';
import 'package:loginapp/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final _usernameController=TextEditingController();
  
  final _passwordController=TextEditingController();
  
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 50,right: 50),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Enter username'),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'value is empty';
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 30,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Enter password'),
                 validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'value is empty';
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton.icon(onPressed: (){
                if(_formkey.currentState!.validate()){
                  checkLogin(context);
                  }
                }, 
                icon:const Icon(Icons.check), label:const Text('LOGIN'))
            ] ),
          ),
        ),
      ),
    ),);
  }
  void checkLogin(BuildContext ctx)async{ 
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if(_username == _password){
      //goto home
      final _sharedprefs = await SharedPreferences.getInstance();
           await _sharedprefs.setBool(SAVE_KEY_NAME,true);
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>const HomeScreen()));
      
    }else{ 
         ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: EdgeInsets.only(bottom: 80,left: 30,right: 30),
          content: Text('Username password doesnot match')));
    }
  }
}