import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GeneratedUI(),
    );
  }
}

class GeneratedUI extends StatefulWidget {
  @override
  _GeneratedUIState createState() => _GeneratedUIState();
}

class _GeneratedUIState extends State<GeneratedUI> {
  bool isPlaying = false;
  bool isFavorite = false;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0C0C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Header(),
              SizedBox(height: 16),
              NavigationTabs(),
              SizedBox(height: 24),
              SectionTitle(title: "Today's Refreshing Song Recommendations"),
              SizedBox(height: 16),
              RecommendationCard(
                isPlaying: isPlaying,
                onPlayPause: togglePlayPause,
                isFavorite: isFavorite,
                onFavoriteToggle: toggleFavorite,
              ),
              SizedBox(height: 16),
              SongList(),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: SeeAllButton(),
              ),
              SizedBox(height: 32),
              Text(
                'FOR RELAXING',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.25),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Mixes for you',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C1C1E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Your Library',
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '? Hi Logan, Good Evening',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Icon(
          Icons.notifications_none,
          color: Colors.white.withOpacity(0.75),
          size: 28,
        ),
        SizedBox(width: 16),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/profileicon.svg'),
        ),
      ],
    );
  }
}

class NavigationTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TabButton(label: 'For you'),
        SelectedTabButton(label: 'Relax'),
        TabButton(label: 'Workout'),
        TabButton(label: 'Travel'),
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  const TabButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}

class SelectedTabButton extends StatelessWidget {
  final String label;
  const SelectedTabButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  const RecommendationCard({
    Key? key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  'assets/Burger.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peace',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '22 songs',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                    ),
                    onPressed: onPlayPause,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 48,
                child: IconButton(
                  icon: Image.asset(
                    isFavorite
                        ? 'assets/heart_filled_icon.jpeg'
                        : 'assets/heart_filled_icon.jpeg',
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SongList extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      'title': 'Weightless',
      'artist': 'Marconi Union',
      'imageUrl': 'https://s3-alpha.figma.com/images/d7d37ccac231275baf39e9ff874ece93e0c8bd09',
    },
    {
      'title': 'Nothing It Can',
      'artist': 'Helios',
      'imageUrl': 'https://s3-alpha.figma.com/images/66d40c49706905871f0fd5394dc3e6d295f9349a',
    },
    {
      'title': 'Small Memory',
      'artist': 'Jon Hopkins - Insides',
      'imageUrl': 'https://s3-alpha.figma.com/images/6996fd8f543e5fd90ff33a4fece7fbf6e54dcef4',
    },
    {
      'title': 'Close To Home',
      'artist': 'Lyle Mays',
      'imageUrl': 'https://s3-alpha.figma.com/images/57d7760305a7a9ef6f0fe0a929c645a44a46e9e4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: songs.map((song) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(song['imageUrl']!),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 40,
                height: 40,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      song['artist']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(0.75)),
                onPressed: () {},
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class SeeAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Text(
          'See All',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}