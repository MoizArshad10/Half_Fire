import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context){
    if(_formKey.currentState!.validate()){
      login();
    }
  }

 void login()async{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  
  final email = emailController.text;
  final password  = passwordController.text;

  try {
    final UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
    final DocumentSnapshot snapshot = await db.collection("myDatabase").doc().get();
    final data = snapshot.data();

    showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Text("User has been Login Successfully"),
            icon: Icon(CupertinoIcons.car_detailed),
            iconColor: Colors.purple,
            backgroundColor: Colors.blue,
          );
        });
        print("User has been logged in!");

  } catch (e) {
    showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Text("User has not been Login Successfully"),
            icon: Icon(CupertinoIcons.car_detailed),
            iconColor: Colors.purple,
            backgroundColor: Colors.blue,
          );
        });
        print("Error");
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.network("https://images.pexels.com/photos/28374775/pexels-photo-28374775/free-photo-of-serene-urban-courtyard-with-archway-and-foliage.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",height: 200.0,fit: BoxFit.cover,width: double.infinity,),
            SizedBox(height: 20.0,),
            Text("Welcome",style: TextStyle(color: Colors.blue),textScaleFactor: 1.8,),
            SizedBox(height: 20.0,),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical:  18.0 , horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Email can not be empty";
                  }
                  else if(!value.contains("@gmail.com")){
                      return "Invalid Email";
                  }
                  return null;
                },
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:  18.0 , horizontal: 20.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "password can not be empty";
                  }
                  else if(value.length<=6){
                    return "Password must be greater than six characters";
                  }
                  return null;
                },
                controller: passwordController,
              ),
            ),
            ElevatedButton.icon(onPressed: ()=>moveToHome(context),icon: Icon(Icons.login), label: Text("Login"),style: ElevatedButton.styleFrom(
              minimumSize: Size(160.0, 50.0),
              foregroundColor: Colors.blue,
              shadowColor: Colors.blue,
              elevation: 5
            ),)
          ],
        ),
      ),
    );
  }
}