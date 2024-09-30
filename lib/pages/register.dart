
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 TextEditingController userController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context){
    if(_formKey.currentState!.validate()){
      Register();
    }
  }

    void Register()async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;  
      final name = userController.text;
      final email = emailController.text;
      final password = passwordController.text;

      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
        await db.collection("myDatabase").doc(user.user?.uid).set({
          "Name" : name,
          "Email" : email,
          "Password" : password
        });

        print("User has been Register");
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Text("User has been Register Successfully"),
            icon: Icon(CupertinoIcons.home),
            iconColor: Colors.purple,
            backgroundColor: Colors.blue,
          );
        });
      } catch (e) {
        print("Error");
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Text("User has not been Register Successfully"),
            icon: Icon(CupertinoIcons.cursor_rays),
            iconColor: Colors.purple,
            backgroundColor: Colors.blue,
          );
        });
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
                  labelText: "username",
                  prefixIcon: Icon(Icons.account_box_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Username can not be empty";
                  }
                  return null;
                },
                controller: userController,
              ),
            ),
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
            ElevatedButton.icon(onPressed: ()=>moveToHome(context),icon: Icon(Icons.app_registration), label: Text("Register"),style: ElevatedButton.styleFrom(
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