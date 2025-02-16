import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatalogoPage extends StatefulWidget {
  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> imageUrls = [
    'https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg',
    'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg',
    'https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg',
    'https://images.pexels.com/photos/210182/pexels-photo-210182.jpeg',
  ];
  List<String> destinations = ["London", "Paris", "New York", "Tokyo"];
  List<String> prices = ["\$2000.0", "\$2400.0", "\$1800.0", "\$2600.0"];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDestinations = destinations
        .where((destino) =>
            destino.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TripWayo',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Destinos'),
            Tab(text: 'Favoritos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDestinosTab(filteredDestinations),
          _buildFavoritosTab(),
        ],
      ),
    );
  }

  Widget _buildDestinosTab(List<String> filteredDestinations) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search here',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryIcon(Icons.flight, Colors.purple),
                _buildCategoryIcon(Icons.hotel, Colors.blue),
                _buildCategoryIcon(Icons.directions_bus, Colors.orange),
                _buildCategoryIcon(Icons.directions_car, Colors.lightBlue),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Destinations',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See All',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredDestinations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detalles');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'destino_${filteredDestinations[index]}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: imageUrls[index],
                                width: 150,
                                height: 180,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            filteredDestinations[index],
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            prices[index],
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritosTab() {
    return Center(
      child: Text(
        'Aquí estarán tus destinos favoritos',
        style: GoogleFonts.poppins(fontSize: 18),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}
