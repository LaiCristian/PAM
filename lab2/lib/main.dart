import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Yogyakarta',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.png'), // Your profile image
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Joe Samanta",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Image.asset(
            'assets/home_card.svg',
            fit: BoxFit.cover, // This ensures the image covers the area proportionally
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search barber's, haircut service...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Nearest Barbershop",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildBarberCard('Alana Barbershop', 'Banguntapan (5 km)', 4.5, 'assets/barber_1.jpg'),
          _buildBarberCard('Hercha Barbershop', 'Jalan Kaliurang (8 km)', 5.0, 'assets/barber_2.jpg'),
          _buildBarberCard('Barberking', 'Jogja Expo Centre (12 km)', 4.5, 'assets/barber_3.jpg'),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("See All"),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Most recommended",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildBarberCard('Masterpiece Barbershop', 'Jogja Expo Centre (2 km)', 5.0, 'assets/barber_4.jpg', isRecommended: true),
          _buildBarberCard('Varcity Barbershop', 'Condongcatur (10 km)', 4.5, 'assets/barber_5.jpg'),
          _buildBarberCard('Twinsky Monkey Barber', 'Jl Taman Siswa (8 km)', 5.0, 'assets/barber_6.jpg'),
          _buildBarberCard('Barberman', 'J-Walk Centre (17 km)', 4.5, 'assets/barber_7.jpg'),
        ],
      ),
    );
  }

  Widget _buildBarberCard(String name, String location, double rating, String imagePath, {bool isRecommended = false}) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath), // Barber shop image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    SizedBox(width: 4),
                    Text(rating.toString()),
                  ],
                ),
                if (isRecommended)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Booking"),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
