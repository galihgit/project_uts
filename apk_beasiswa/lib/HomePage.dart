import 'package:flutter/material.dart';
import 'package:apk_beasiswa/DaftarPage.dart';
import 'package:apk_beasiswa/profile_detail.dart';
import 'package:apk_beasiswa/detail.dart';
import 'bookmarkPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pages = [
      Home(),
      BookmarkPage(),
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[_currentIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beasiswaku'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                title: 'Beasiswa A',
                description: 'Deskripsi Beasiswa A',
                backgroundColor: Colors.blueAccent,
              ),
              SizedBox(height: 20),
              _buildCard(
                title: 'Beasiswa B',
                description: 'Deskripsi Beasiswa B',
                backgroundColor: Colors.greenAccent,
              ),
              SizedBox(height: 20),
              _buildCard(
                title: 'Beasiswa C',
                description: 'Deskripsi Beasiswa C',
                backgroundColor: Colors.orangeAccent,
              ),
              SizedBox(height: 20),
              _buildCard(
                title: 'Beasiswa D',
                description: 'Deskripsi Beasiswa D',
                backgroundColor: Colors.purpleAccent,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required Color backgroundColor,
  }) {
    return Container(
      width: 341,
      height: 218,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Stack(
        children: [
          _buildTexts1(title),
          _buildTexts2(description),
          _buildTexts3(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildTexts1(String title) {
    return Positioned(
      left: 55,
      top: 55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Gotham Black',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTexts2(String description) {
    return Positioned(
      left: 14,
      top: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 9,
              fontFamily: 'Gotham Black',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTexts3() {
    return Positioned(
      left: 250,
      top: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3 months to go',
            style: TextStyle(
              color: Color(0xFF41B8BF),
              fontSize: 8,
              fontFamily: 'Gotham Black',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Positioned(
      left: 14,
      top: 175,
      child: Row(
        children: [
          _buildButton('Lihat Detail', Color(0xFFBBB265), () {
            // Navigasi ke halaman detail beasiswa ketika tombol ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => detail()),
            );
          }),
          SizedBox(width: 10),
          _buildButton('Daftar', Color(0xFF4EA8AD), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Daftar()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback? onPressed) {
    return Container(
      width: 143,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextButton(
        onPressed: onPressed, // Jalankan fungsi onPressed saat tombol ditekan
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Gotham Black',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
