
// ignore_for_file: camel_case_types, collection_methods_unrelated_type, sized_box_for_whitespace

import 'package:flutter/material.dart';

class variables{

  String nombre;
  String apellido;

  variables({
    required this.nombre, 
    required this.apellido});
}

class Practice2Screen extends StatefulWidget {
  const Practice2Screen({super.key});

  @override
  State<Practice2Screen> createState() => _Practice2ScreenState();
}

class _Practice2ScreenState extends State<Practice2Screen> {

  final List<variables> listadoUsuarios = [];
  final TextEditingController nombreControl = TextEditingController();
  final TextEditingController apellidoControl = TextEditingController();
  int? index;

  void crearUsuarios(){

    setState(() {
      
      listadoUsuarios.add(variables(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 10,
        title: const Text('Crear usuarios'),
        centerTitle: true,
        leading: const Icon(Icons.receipt_long_sharp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  elevation: 10,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                ),
                onPressed: (){crearUsuarios();}, 
                child: const Text('Guardar', style: TextStyle(color: Colors.white),)),
          
                const SizedBox(height: 20,),
                Container(
                  height: 350,
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

                                showDialog(
                                  context: context, 
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      title: Row(
                                        children: [
                                          Title(
                                            color: Colors.white, 
                                            child:const  Text('Editar usuario')),

                                          const Spacer(),
                                          IconButton(
                                            onPressed: (){}, 
                                            icon: const Icon(Icons.close))
                                        ],),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [

                                          TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Nombre',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                              )
                                            ),
                                          ),

                                          const SizedBox(height: 10,),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Apellido',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15)))
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            TextButton(
                                              onPressed: (){}, 
                                              child: const Text('Guardar')),

                                            const SizedBox(width: 15,),
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
                              icon: const Icon(Icons.edit)),

                            const SizedBox(width: 15,),
                            IconButton(
                              onPressed: (){

                                showDialog(
                                  context: context, 
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('¿Seguro que deseas eliminar?'),
                                      content: const Text('¿Estas realmente seguro que deseas eliminar este usuario?, este no se podra recuperar despues.'),
                                      actions: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            TextButton(
                                              child: const Text('Eliminar'),
                                              onPressed: (){borrarUsuarios(index);}, 
                                              ),

                                            const SizedBox(width: 30,),
                                            TextButton(
                                              onPressed: (){Navigator.pop(context);}, 
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
                  },),
                )
            ],
          ),
        ),
      ),
    );
  }
}
