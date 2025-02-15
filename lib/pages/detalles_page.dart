import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetallesPage extends StatefulWidget {
  @override
  _DetallesPageState createState() => _DetallesPageState();
}

class _DetallesPageState extends State<DetallesPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'destino_London',
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.network(
                      'https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New York Tour',
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 5),
                      Text('4.5 Rating'),
                      SizedBox(width: 10),
                      Icon(Icons.thermostat, color: Colors.blue, size: 20),
                      SizedBox(width: 5),
                      Text('16°C'),
                      SizedBox(width: 10),
                      Icon(Icons.timer, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text('5 hrs'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "New York City, often called the Big Apple, is known for its iconic landmarks such as the Statue of Liberty, Central Park, and Times Square. It's a vibrant city that never sleeps.",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$1800.0',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirmar Reserva'),
                                content: Text(
                                    '¿Estás seguro de reservar este viaje?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('¡Reserva confirmada!'),
                                        ),
                                      );
                                    },
                                    child: Text('Confirmar'),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
