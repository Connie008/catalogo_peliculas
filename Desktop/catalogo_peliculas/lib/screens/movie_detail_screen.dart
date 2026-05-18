import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {

  final Map pelicula;

  const MovieDetailScreen({
    super.key,
    required this.pelicula,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          pelicula["titulo"],
        ),

        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Image.network(

              pelicula["imagen"],

              width: double.infinity,
              height: 350,

              fit: BoxFit.cover,

              errorBuilder:
                  (context, error, stackTrace) {

                return Container(

                  height: 350,

                  color: Colors.grey[300],

                  child: const Center(

                    child: Icon(
                      Icons.movie,
                      size: 100,
                    ),
                  ),
                );
              },
            ),

            Padding(

              padding: const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(

                    pelicula["titulo"],

                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "📅 Año: ${pelicula["anio"]}",
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "🎥 Director: ${pelicula["director"]}",
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "🎬 Género: ${pelicula["genero"]}",
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  const Text(

                    "Sinopsis",

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(

                    pelicula["sinopsis"],

                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}