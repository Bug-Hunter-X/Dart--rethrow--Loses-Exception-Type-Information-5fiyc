```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success
      final jsonData = json.decode(response.body);
      // Process jsonData
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
    // Here's where the bug is likely: rethrow doesn't propagate the original exception type 
    rethrow; 
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
    // The original exception type is lost here.
    print('Caught error: $e'); // This only prints the string representation of the Exception
  }
}
```