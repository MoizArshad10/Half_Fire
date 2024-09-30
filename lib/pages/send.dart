import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context){
    if(_formKey.currentState!.validate()){
    sendData();
    }
  }


  void sendData()async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    final email = emailController.text;
    final password = passwordController.text;
    final number = numberController.text;

    try {
      await db.collection("xtremeData").doc().set({
        "Email" : email,
        "Password" : password,
        "Number" : number
      }); 
      print("Data has been inserted Successfully");
      showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Text("User has been Inserted Successfully"),
            icon: Icon(CupertinoIcons.car_detailed),
            iconColor: Colors.purple,
            backgroundColor: Colors.blue,
          );
        });
    } catch (e) {
      print("Data has not been inserted Successfully");
      
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
             Padding(
              padding: const EdgeInsets.symmetric(vertical:  18.0 , horizontal: 20.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Number can not be empty";
                  }
                  else if(value.length<=6){
                    return "Number must be greater than six characters";
                  }
                  return null;
                },
                controller: numberController,
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