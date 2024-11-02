import 'package:event_app/view/event_details.dart';
import 'package:event_app/view/event_list.dart';
import 'package:flutter/material.dart';
import 'model/event.dart';

void main() {
  runApp(EventApp());
}

class EventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => EventListPage(),
        '/event_detail': (context) => EventDetailPageWrapper(),
      },
    );
  }
}

class EventDetailPageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context)!.settings.arguments as Event;
    return EventDetailPage(event: event);
  }
}
