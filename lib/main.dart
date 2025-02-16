import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/portada_page.dart'; // Importa la página de portada
import 'pages/catalogo_page.dart'; // Importa la página de catálogo
import 'pages/detalles_page.dart'; // Importa la página de detalles

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange, // Color primario naranja
        scaffoldBackgroundColor: Color(0xFFFDF5E6), // Fondo crema
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PortadaPage(), // Página de portada
        '/catalogo': (context) => CatalogoPage(), // Página de catálogo
        '/detalles': (context) => DetallesPage(), // Página de detalles
      },
    );
  }
}
