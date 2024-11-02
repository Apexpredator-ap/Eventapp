import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/mock_data.dart';

class EventListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Center(
          child: Text(
            'EVENTS',
            style: GoogleFonts.jost(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16), // Adds space between AppBar and ListView
            Expanded(
              child: ListView.builder(
                itemCount: mockEvents.length,
                itemBuilder: (context, index) {
                  final event = mockEvents[index];
                  return Card(
                    child: ListTile(
                      title: Text(event.title),
                      subtitle: Text(event.date.toString()),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/event_detail',
                            arguments: event,
                          );
                        },
                        child: Text("RSVP"),
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
}
