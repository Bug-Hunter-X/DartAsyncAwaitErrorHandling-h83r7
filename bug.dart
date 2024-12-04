```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success! 
      final jsonResponse = json.decode(response.body);
      // Process the JSON response...
    } else {
      // Handle error - This is where the bug might be!
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (network errors, JSON parsing errors, etc.)
    print('Error fetching data: $e');
    // Ignoring the error might mask the real problem. Add more specific error handling.
    // Re-throwing the error might be necessary depending on the context
    // rethrow;
  }
}
```