```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success
      final jsonData = json.decode(response.body);
      // Process jsonData
    } else {
      // Handle error by throwing the original exception type
      throw Exception('Failed to load data: ${response.statusCode}'); 
    }
  } catch (e) {
    // Correctly propagate the exception
    print('Error: $e');
    rethrow; // Rethrows the original exception
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
    // Now we catch the original exception type. 
    if (e is Exception) {
       print('Caught Exception: ${e.toString()}');
    } else {
       print('Caught error: $e');
    }
  }
}
```