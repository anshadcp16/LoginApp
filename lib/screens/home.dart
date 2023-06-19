

import 'package:flutter/material.dart';
import 'package:loginapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

       var arrName=['Anshad','Shahal','Rahul','Shebil','Azad','Arif','Labeeb'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: (){Signout(context);}, icon:const Icon(Icons.exit_to_app))
        ],
      ),
      body:ListView.separated(itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage:AssetImage('assets/images/circleavathar.png'),
             ),
          title: Text(arrName[index]),
          subtitle: const Text('Number'),
          trailing: Text('${index+1}'),

        );
      }, separatorBuilder: (context, index) {
        return const Divider(height:50,thickness:1,);
      }, itemCount: arrName.length));
  }
  Signout(BuildContext ctx)async{
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginScreen()), (route) => false);
  }
}