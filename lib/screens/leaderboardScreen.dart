import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, String>> leaderboardData = [
    {'name': 'Alice', 'score': '1000'},
    {'name': 'Bob', 'score': '950'},
    {'name': 'Charlie', 'score': '900'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboardData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(leaderboardData[index]['name']!),
            trailing: Text('${leaderboardData[index]['score']} points'),
          );
        },
      ),
    );
  }
}
