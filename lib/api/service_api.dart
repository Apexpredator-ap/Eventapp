import 'package:http/http.dart' as http;

Future<bool> rsvpEvent(String name, String email, String eventId) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),  // Mock URL
    body: {'name': name, 'email': email, 'eventId': eventId},
  );
  return response.statusCode == 201;  // Mock success response
}
