class Event {
  final String title;
  final DateTime date;
  final String description;
  final List<String> attendees;

  Event({
    required this.title,
    required this.date,
    required this.description,
    this.attendees = const [],
  });
}
