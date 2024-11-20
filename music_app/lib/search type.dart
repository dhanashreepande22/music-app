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
  List<Map<String, String>> recentSearches = [
    {'title': 'You (feat. Travis Scott)', 'subtitle': 'Song · Don Toliver', 'image': 'assets/images/you_feat_travis_scott.png'},
    {'title': 'John Wick: Chapter 4 (Original So…', 'subtitle': 'Album · Tyler Bates, Joel J. Richard', 'image': 'assets/images/john_wick.png'},
    {'title': 'Maroon 5', 'subtitle': 'Artist', 'image': 'assets/images/maroon_5.png'},
    {'title': 'Phonk Madness', 'subtitle': 'Playlist', 'image': 'assets/images/phonk_madness.png'},
  ];

  void _removeRecentSearch(int index) {
    setState(() {
      recentSearches.removeAt(index);
    });
  }

  void _clearRecentSearches() {
    setState(() {
      recentSearches.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0C0C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.12),
              ),
              height: 56,
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white.withOpacity(0.75)),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Search songs, artist, album or playlist',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.25),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Recent Searches Title
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Recent searches',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Recent Search Items
            Expanded(
              child: ListView.builder(
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  final item = recentSearches[index];
                  return _buildRecentSearchItem(index, item['image']!, item['title']!, item['subtitle']!);
                },
              ),
            ),
            // Clear History
            if (recentSearches.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: _clearRecentSearches,
                    child: Text(
                      'Clear history',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.25),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            // Navigation Bar
            Container(
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white.withOpacity(0.2), width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavBarItem(Icons.home, 'Home', isActive: false),
                  _buildNavBarItem(Icons.search, 'Search', isActive: true),
                  _buildNavBarItem(Icons.library_music, 'Your Library', isActive: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearchItem(int index, String imagePath, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              imagePath,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white.withOpacity(0.75)),
            onPressed: () => _removeRecentSearch(index),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData iconData, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          size: 28,
          color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}