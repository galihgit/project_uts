import 'package:flutter/material.dart';
import 'detail.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<String> bookmarks = [];

  void addBookmark(String content) {
    setState(() {
      bookmarks.add(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: bookmarks.isEmpty
          ? Center(
              child: Text(
                'Belum ada konten yang disimpan',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                return _buildCard(); // menggunakan fungsi _buildCard
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan konten baru
          addBookmark('Konten baru disimpan');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: 341,
      height: 218,
      child: Stack(
        children: [
          _buildBackground(),
          _buildLogo(),
          _buildTexts1(),
          _buildTexts2(),
          _buildTexts3(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      left: 14,
      top: 58,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/26x26"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTexts1() {
    return Positioned(
      left: 55,
      top: 55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Djarum Foundation',
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

  Widget _buildTexts2() {
    return Positioned(
      left: 14,
      top: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Bachelor degree scholarship',
            style: TextStyle(
              color: Colors.black,
              fontSize: 9,
              fontFamily: 'Gotham Black',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'any university in Indonesia',
            style: TextStyle(
              color: Colors.black,
              fontSize: 6,
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
            // Tambahkan aksi lain di sini ketika tombol 'Daftar' ditekan
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
