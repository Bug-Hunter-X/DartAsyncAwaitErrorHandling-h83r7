```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // Process JSON response
      print('Data fetched successfully: $jsonResponse');
    } else {
      // Handle HTTP errors gracefully
      throw HttpException('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on HttpException catch (e) {
    // Handle HTTP exceptions specifically, providing more context
    print('HTTP Error: $e');
     // Consider additional actions like showing an error message to the user.
  } catch (e) {
    // Handle other exceptions (e.g., socket errors, JSON parsing errors)
    print('Error fetching data: $e');
    // Consider appropriate actions based on the error type.
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() => message;
}
```