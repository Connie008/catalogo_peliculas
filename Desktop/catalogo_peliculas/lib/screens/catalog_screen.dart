import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'movie_detail_screen.dart';
import 'admin_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Catálogo de películas"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection('peliculas')
            .snapshots(),

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData ||
              snapshot.data!.docs.isEmpty) {

            return const Center(
              child: Text(
                "No hay películas",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          final peliculas = snapshot.data!.docs;

          return ListView.builder(

            padding: const EdgeInsets.all(12),

            itemCount: peliculas.length,

            itemBuilder: (context, index) {

              final pelicula = peliculas[index];

              final data =
                  pelicula.data() as Map<String, dynamic>;

              return Card(

                elevation: 5,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),

                margin:
                    const EdgeInsets.only(bottom: 20),

                child: ListTile(

                  contentPadding:
                      const EdgeInsets.all(12),

                  leading: ClipRRect(

                    borderRadius:
                        BorderRadius.circular(12),

                    child: Image.network(

                      data['imagen'] ?? '',

                      width: 70,
                      height: 100,

                      fit: BoxFit.cover,

                      errorBuilder:
                          (context, error, stackTrace) {

                        return Container(

                          width: 70,
                          height: 100,

                          color: Colors.grey[300],

                          child: const Icon(
                            Icons.movie,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),

                  title: Text(

                    data['titulo'] ?? '',

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  subtitle: Padding(

                    padding:
                        const EdgeInsets.only(top: 8),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          "🎬 ${data['genero'] ?? ''}",
                        ),

                        Text(
                          "🎥 ${data['director'] ?? ''}",
                        ),

                        Text(
                          "📅 ${data['anio'] ?? ''}",
                        ),
                      ],
                    ),
                  ),

                  trailing: IconButton(

                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),

                    onPressed: () async {

                      await FirebaseFirestore.instance
                          .collection('peliculas')
                          .doc(pelicula.id)
                          .delete();

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(
                          content: Text(
                            "Película eliminada",
                          ),
                        ),
                      );
                    },
                  ),

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            MovieDetailScreen(
                              pelicula: data,
                            ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.deepPurple,

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        onPressed: () {

          Navigator.push(

            context,

            MaterialPageRoute(
              builder: (_) =>
                  const AdminScreen(),
            ),
          );
        },
      ),
    );
  }
}