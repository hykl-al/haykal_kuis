// home_page.dart
import 'package:flutter/material.dart';
import 'dummy.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Opacity(
            opacity: 0.5,
            child: Image.asset(
              'header.png',
              fit: BoxFit.cover,
            )),
        toolbarHeight: 150,
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Column(children: [
          ListTile(
            title: Text(
              'Selamat pagi, $username',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Yuk, buat perubahan positif bagi lingkungan sekarang',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Card(
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(
                  "Apa itu bank sampah keliling?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    "Bank sampah akan hadir di dekat rumah Anda. Pelajari teknisnya lebih lanjut."),
                trailing: Icon(Icons.arrow_forward, color: Colors.purple),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jadwal Keliling",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: scheduleData.length,
              itemBuilder: (context, index) {
                final schedule = scheduleData[index];
                return _scheduleCard(schedule.location, schedule.bankName,
                    schedule.startTime, schedule.endTime);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _scheduleCard(
      String location, String bankName, String startTime, String endTime) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(Icons.location_on, color: Colors.purple),
        title: Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bankName),
            Row(
              children: [
                Text("Start: $startTime WIB"),
                SizedBox(width: 16),
                Text("End: $endTime WIB"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
