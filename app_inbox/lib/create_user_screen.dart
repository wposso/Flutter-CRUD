
// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class dataUsers{

  String firstName;
  String lastName;

  dataUsers({
    required this.firstName, 
    required this.lastName});
}

class CreateUserScreen extends StatefulWidget {
   
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {

  final List<dataUsers> usersList = [];
  final TextEditingController firstNameControl = TextEditingController();
  final TextEditingController lastNameControl = TextEditingController();
  int? index;

  void createUsers(){

    if(firstNameControl.text.isEmpty || lastNameControl.text.isEmpty){
      return;
    }
    
    if(index == null){

      setState(() {
        
        usersList.add(dataUsers(
        firstName: firstNameControl.text, 
        lastName: lastNameControl.text));
      });
    }
    else{

    setState(() {
      
      usersList[index!] = dataUsers(
        firstName: firstNameControl.text, 
        lastName: lastNameControl.text);
    });
   }

   firstNameControl.clear();
   lastNameControl.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text('Create user'),
        centerTitle: true,
        leading: const Icon(Icons.exit_to_app_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
          
              TextFormField(
                controller: firstNameControl,
                decoration: const InputDecoration(
                  hintText: 'Fisrt name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),
              ),
          
              const SizedBox(height: 10,),
              TextFormField(
                controller: lastNameControl,
                decoration: const InputDecoration(
                  hintText: 'Last name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),
          
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  elevation: 10,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),
                onPressed: (){
                  createUsers();
                }, 
                child: const Text('Save', style: TextStyle(color: Colors.white),)),
          
                const SizedBox(height: 30,),
                Container(
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      final user = usersList[index];
                      return ListTile(
                        title: Text('${user.firstName} ${user.lastName}'),
                      );
                    },),
                )
            ],
          ),
        ),
      )
    );
  }
}