
// ignore_for_file: camel_case_types, avoid_unnecessary_containers, sized_box_for_whitespace, collection_methods_unrelated_type

import 'package:flutter/material.dart';

class dataUsers{

  String fisrtName;
  String lastName;

  dataUsers({
    required this.fisrtName, 
    required this.lastName});
}

class Demo1Screen extends StatefulWidget {
   
  const Demo1Screen({super.key});

  @override
  State<Demo1Screen> createState() => _Demo1ScreenState();
}

class _Demo1ScreenState extends State<Demo1Screen> {

  final TextEditingController fisrtNameControl = TextEditingController();
  final TextEditingController lastNameControl = TextEditingController();
  final List<dataUsers> listUsers = [];
  int? index;

  void createUser(){

    setState(() {
      listUsers.add(dataUsers(
        fisrtName: fisrtNameControl.text, 
        lastName: lastNameControl.text));
    });

    fisrtNameControl.clear();
    lastNameControl.clear();
  }

  void deleteUser(int index){

    setState(() {
      listUsers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Create user'),
        centerTitle: true,
        leading: const Icon(Icons.supervised_user_circle_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
        
            TextFormField(
              controller: fisrtNameControl,
              decoration: const InputDecoration(
                hintText: 'Fisrt name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 10,),
            TextFormField(
              controller: lastNameControl,
              decoration: const InputDecoration(
                hintText: 'Last name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                fixedSize:const  Size(250, 50),
                backgroundColor: Colors.blue,
                elevation: 10
              ),
              onPressed: (){
                createUser();
              }, 
              child: const Text('Save data', style: TextStyle(color: Colors.white),)),

              const SizedBox(height: 30,),
              Container(
                width: 350,
                height: 250,
                child: ListView.builder(
                  itemCount: listUsers.length,
                  itemBuilder: (context, index) {
                    
                    final users = listUsers[index];
                    return ListTile(
                      
                      title: Text('${users.fisrtName} ${users.lastName}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.edit)),

                          const SizedBox(width: 15,),
                          IconButton(
                            onPressed: (){
                              deleteUser(index);
                            }, 
                            icon: const Icon(Icons.delete))
                        ],
                      ),
                    );
                  },),
              )
          ],
        ),
      ),
    );
  }
}