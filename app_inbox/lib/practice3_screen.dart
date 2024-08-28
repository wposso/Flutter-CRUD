
// ignore_for_file: camel_case_types, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class datosUsuarios{

  String nombre;
  String apellido;

  datosUsuarios({
    required this.nombre, 
    required this.apellido});
}

class practice_3_screen extends StatefulWidget {
  const practice_3_screen({super.key});

  @override
  State<practice_3_screen> createState() => _practice_3_screenState();
}

class _practice_3_screenState extends State<practice_3_screen> {

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

    nombreControl.clear();
    apellidoControl.clear();
  }

  void borrarUsuarios(int index){

    setState(() {
      
      listadoUsuarios.removeAt(index);
    });
  }

  void editarUsuarios(int index){

    setState(() {
      
      listadoUsuarios[index] = datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text);
    });

    nombreControl.clear();
    apellidoControl.clear();
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: 'Nombre'
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
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                elevation: 10,
                backgroundColor: Colors.blue
              ),
              onPressed: (){
                crearUsuarios();
              }, 
              child: const Text('Guardar', style: TextStyle(color: Colors.white),)),

              const SizedBox(height: 20,),
              Container(
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemCount: listadoUsuarios.length,
                  itemBuilder: (context, index) {
                    
                    final usuarios = listadoUsuarios[index];
                    return ListTile(
                      title: Text('${usuarios.nombre} ${usuarios.apellido}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            onPressed: (){

                              nombreControl.text = listadoUsuarios[index].nombre;
                              apellidoControl.text = listadoUsuarios[index].apellido;

                              showDialog(
                                context: context, 
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Editar usuario'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        TextFormField(
                                            controller: nombreControl,
                                            decoration: const InputDecoration(
                                              hintText: 'Editar nombre',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                              )
                                            ),
                                          ),

                                          const SizedBox(height: 10,),
                                          TextFormField(
                                            controller: apellidoControl,
                                            decoration: const InputDecoration(
                                              hintText: 'Editar apellido',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                              )
                                            ),
                                          )
                                      ],
                                    ),
                                    actions: [

                                      TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                          editarUsuarios(index);
                                        }, 
                                        child: const Text('Actualizar', style: TextStyle(color: Colors.red),)),

                                      const SizedBox(width: 30,),
                                      TextButton(
                                        onPressed: (){}, 
                                        child: const Text('Cancelar'))
                                    ],
                                  );
                                },);
                            }, 
                            icon: const Icon(Icons.edit)),

                          const SizedBox(width: 15,),
                          IconButton(
                            onPressed: (){

                              showDialog(
                                barrierDismissible: false,
                                context: context, 
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Message'),
                                    content: const Text('¿Esta seguro que en realidad desea borrar este usuario?, no lo podra recuperar despues'),
                                    actions: [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                      TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                          borrarUsuarios(index);
                                          }, 
                                        child: const Text('Eliminar', style: TextStyle(color: Colors.red),)),

                                      const SizedBox(width: 30,),
                                      TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        }, 
                                        child: const Text('Cancelar'))
                                        ],
                                      )

                                    ],
                                  );
                                },);
                              
                            }, 
                            icon: const Icon(Icons.delete))
                        ],
                      ),
                    );
                  },)
              )
          ],
        ),
      ),
    );
  }
}
