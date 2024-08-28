
// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';

class datosUsuarios{

  String nombre;
  String apellido;

  datosUsuarios({
    required this.apellido, 
    required this.nombre});
}

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {

  final List<datosUsuarios> listadoUsuarios = [];
  final TextEditingController primerNombre = TextEditingController();
  final TextEditingController primerApellido = TextEditingController();
  int? index;

  void crearUsuarios(){

    setState(() {
      
      if(index == null){
        listadoUsuarios.add(datosUsuarios(
        apellido: primerApellido.text, 
        nombre: primerNombre.text));
      }
      else{
        listadoUsuarios[index!] = datosUsuarios(
          apellido: primerApellido.text, 
          nombre: primerNombre.text);
      }

      index = null;

    });

    primerApellido.clear();
    primerNombre.clear();
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Crear usuario'),
        centerTitle: true,
        leading: const Icon(Icons.note_alt_rounded),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
        
            const SizedBox(height: 20,),
            TextFormField(
              controller: primerNombre,
              decoration: const InputDecoration(
                hintText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              )
            ),
        
            const SizedBox(height: 10,),
            TextFormField(
              controller: primerApellido,
              decoration: const InputDecoration(
                hintText: 'Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),
        
            const SizedBox(height: 60,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.blue,
                fixedSize: const Size(300, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
              onPressed: (){
                crearUsuarios();
              }, 
              child: Text(index == null ? 'Guardar' : 'Actualizar', 
              style: const TextStyle(color: Colors.white),)),

              const SizedBox(height: 20,),
              Container(
                width: 350,
                height: 250,
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
                              setState(() {
                                
                                index == index;
                                primerApellido.text = usuarios.apellido;
                                primerNombre.text = usuarios.nombre;
                              });
                            }, 
                            icon: const Icon(Icons.edit)),

                          const SizedBox(width: 10,),
                          IconButton(
                            onPressed: (){
                              borrarUsuarios(index);
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
