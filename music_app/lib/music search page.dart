import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GeneratedUI());
  }
}

class GeneratedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0C0C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.75)),
                    hintText: 'Search songs, artist, album or...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.75)),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    // Implement search
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.trending_up, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Trending artists',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ArtistProfile(image: 'assets/artist1.png', name: 'Childish Gambino'),
                  ArtistProfile(image: 'assets/artist2.png', name: 'Marvin Gaye'),
                  ArtistProfile(image: 'assets/artist3.png', name: 'Kanye West'),
                  ArtistProfile(image: 'assets/artist4.png', name: 'Justin Beiber'),
                  ArtistProfile(image: 'assets/artist5.png', name: 'Charlie Puth'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Browse',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  CategoryTile(image: 'assets/tamil.png', label: 'TAMIL'),
                  CategoryTile(image: 'assets/international.png', label: 'INTERNATIONAL'),
                  CategoryTile(image: 'assets/pop.png', label: 'POP'),
                  CategoryTile(image: 'assets/hiphop.png', label: 'HIP-HOP'),
                  CategoryTile(image: 'assets/dance.png', label: 'DANCE'),
                  CategoryTile(image: 'assets/country.png', label: 'COUNTRY'),
                  CategoryTile(image: 'assets/indie.png', label: 'INDIE'),
                  CategoryTile(image: 'assets/jazz.png', label: 'JAZZ'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0C0C0C),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music, color: Colors.white),
            label: 'Your Library',
          ),
        ],
        onTap: (index) {
          // Implement navigation
        },
      ),
    );
  }
}

class ArtistProfile extends StatelessWidget {
  final String image;
  final String name;

  ArtistProfile({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 36,
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  final String label;

  CategoryTile({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Implement genre functionality
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}