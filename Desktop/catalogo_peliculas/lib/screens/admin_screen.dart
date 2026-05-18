import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminScreen extends StatefulWidget {

  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  final tituloController = TextEditingController();
  final anioController = TextEditingController();
  final directorController = TextEditingController();
  final generoController = TextEditingController();
  final sinopsisController = TextEditingController();
  final imagenController = TextEditingController();

  Future<void> agregarPelicula() async {

    await FirebaseFirestore.instance
        .collection("peliculas")
        .add({

      "titulo": tituloController.text,
      "anio": anioController.text,
      "director": directorController.text,
      "genero": generoController.text,
      "sinopsis": sinopsisController.text,
      "imagen": imagenController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
        content: Text("Película agregada"),
      ),
    );

    tituloController.clear();
    anioController.clear();
    directorController.clear();
    generoController.clear();
    sinopsisController.clear();
    imagenController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Administración"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: "Título",
              ),
            ),

            TextField(
              controller: anioController,
              decoration: const InputDecoration(
                labelText: "Año",
              ),
            ),

            TextField(
              controller: directorController,
              decoration: const InputDecoration(
                labelText: "Director",
              ),
            ),

            TextField(
              controller: generoController,
              decoration: const InputDecoration(
                labelText: "Género",
              ),
            ),

            TextField(
              controller: sinopsisController,
              decoration: const InputDecoration(
                labelText: "Sinopsis",
              ),
            ),

            TextField(
              controller: imagenController,
              decoration: const InputDecoration(
                labelText: "URL imagen",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: agregarPelicula,

                child: const Text("Agregar película"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}