import 'package:event_app/view/rsvp_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/event.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  EventDetailPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          event.title,
          style: GoogleFonts.jost(),
        )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.description, style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Attendees:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...event.attendees.map((attendee) => Text(attendee)).toList(),
              SizedBox(height: 20),
              RSVPForm(event: event),
            ],
          ),
        ),
      ),
    );
  }
}
