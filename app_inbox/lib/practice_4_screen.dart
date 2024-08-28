
// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:app_inbox/usuarios_screen.dart';
import 'package:flutter/material.dart';

class datosUsuarios{

  String nombre;
  String apellido;

  datosUsuarios({required this.nombre, required this.apellido});
}

class practice_4_screen extends StatefulWidget {
  const practice_4_screen({super.key});

  @override
  State<practice_4_screen> createState() => _practice_4_screenState();
}

class _practice_4_screenState extends State<practice_4_screen> {

  final List<datosUsuarios> listadoUsuarios = [];
  final TextEditingController nombreControl = TextEditingController();
  final TextEditingController apellidoControl = TextEditingController();
  int? index;

  void crearUsuarios(){

    setState(() {
      
      listadoUsuarios.add(datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text));
    });

    apellidoControl.clear();
    nombreControl.clear();
  }

  void actualizarUsuarios(int index){

    setState(() {
      
      listadoUsuarios[index] = datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text);
    });

    apellidoControl.clear();
    nombreControl.clear();
  }

  void eliminarUsuarios(int index){

    setState(() {

    listadoUsuarios.removeAt(index);  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Crear usuario'),
        centerTitle: true,
        leading: const Icon(Icons.receipt_long_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [

            const SizedBox(height: 20,),
            TextFormField(
              controller: nombreControl,
              decoration: const InputDecoration(
                hintText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 10,),
            TextFormField(
              controller: apellidoControl,
              decoration: const InputDecoration(
                hintText: 'Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 50),
                backgroundColor: Colors.blue,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
              onPressed: (){
                crearUsuarios();
              }, 
              child: const  ListTile(
                title: Text('Guardar', style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.save_alt, color: Colors.white,),
              )),

              
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.person_pin_sharp),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UsuariosScreen(listadoUsuarios: listadoUsuarios),));
      },),
    );
  }
}
