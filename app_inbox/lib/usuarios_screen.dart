import 'package:app_inbox/practice_4_screen.dart';
import 'package:flutter/material.dart';

class UsuariosScreen extends StatelessWidget {
  final List<datosUsuarios> listadoUsuarios;
   
  const UsuariosScreen({super.key, required this.listadoUsuarios});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Lista de usuarios'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
        
            const SizedBox(height: 20,),
              Container(
                height: 250,
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

                              // nombreControl.text = listadoUsuarios[index].nombre;
                              // apellidoControl.text = listadoUsuarios[index].apellido;

                              // showDialog(
                              //   context: context, 
                              //   builder: (context) {
                              //     return AlertDialog(
                              //       title: const Text('Editar usuarios'),
                              //       content: Column(
                              //         mainAxisSize: MainAxisSize.min,
                              //         children: [

                              //           const Text('Aquí podras editar la información de los usuarios.'),
                              //           const SizedBox(height: 20,),

                              //           TextFormField(
                              //             controller: nombreControl,
                              //             decoration: const InputDecoration(
                              //               hintText: 'Editar nombre',
                              //               border: OutlineInputBorder(
                              //                 borderRadius: BorderRadius.all(Radius.circular(15))
                              //               )
                              //             ),
                              //           ),

                              //           const SizedBox(height: 10,),
                              //           TextFormField(
                              //             controller: apellidoControl,
                              //             decoration: const InputDecoration(
                              //               hintText: 'Editar apellido',
                              //               border: OutlineInputBorder(
                              //                 borderRadius: BorderRadius.all(Radius.circular(15))
                              //               )
                              //             ),
                              //           ),
                              //         ],
                              //       ),

                              //       actions: [
                              //         Row(
                              //           children: [

                              //             TextButton(
                              //               onPressed: (){
                              //                 Navigator.pop(context);
                              //                 actualizarUsuarios(index);
                              //               }, 
                              //               child: const Text('Actualizar', style: TextStyle(color: Colors.red),)),

                              //             const SizedBox(width: 30,),
                              //             TextButton(
                              //               onPressed: (){
                              //                 Navigator.pop(context);
                              //               }, 
                              //               child: const Text('Cancelar'))
                              //           ],
                              //         )
                              //       ],
                              //     );
                              //   },);
                            }, 
                            icon: const Icon(Icons.edit)),

                          const SizedBox(width: 20,),
                          IconButton(
                            onPressed: (){

                              // showDialog(
                              //   context: context, 
                              //   builder: (context) {
                              //     return AlertDialog(
                              //       title: const Text('Eliminar usuario'),
                              //       content: const Column(
                              //         mainAxisSize: MainAxisSize.min,
                              //         children: [

                              //           Text('¿Esta seguro que sedea eliminar este usuario?, este no se podrá recuperar despues.'),
                              //           SizedBox(height: 20,),

                              //         ],
                              //       ),

                              //       actions: [
                              //         Row(
                              //           children: [

                              //             TextButton(
                              //               onPressed: (){
                              //                 eliminarUsuarios(index);
                              //                 Navigator.pop(context);
                              //               }, 
                              //               child: const Text('Eliminar', style: TextStyle(color: Colors.red),)),

                              //             const SizedBox(width: 30,),
                              //             TextButton(
                              //               onPressed: (){
                              //                 Navigator.pop(context);
                              //               }, 
                              //               child: const Text('Cancelar'))
                              //           ],
                              //         )
                              //       ],
                              //     );
                              //   },);
                            }, 
                            icon: const Icon(Icons.delete))
                        ],
                      ),
                    );
                  },),
              )
          ],
        ),
      )
    );
  }
}