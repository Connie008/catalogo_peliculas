import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Catálogo de películas"),
        centerTitle: true,
      ),

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.movie,
                size: 120,
              ),

              const SizedBox(height: 20),

              const Text(
                "Bienvenido",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Explora tu catálogo de películas",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

  Navigator.push(

    context,

    MaterialPageRoute(
      builder: (context) =>
          const LoginScreen(),
    ),
  );
},

                  child: const Text("Iniciar sesión"),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,

                child: OutlinedButton(

                  onPressed: () {

  Navigator.push(

    context,

    MaterialPageRoute(
      builder: (context) =>
          const RegisterScreen(),
    ),
  );
},

                  child: const Text("Registrarse"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}