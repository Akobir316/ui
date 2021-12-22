import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_ui/app/http/todos.dart';

class ApiClient {
  Future<List<dynamic>> getTodos() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);
    final todos =
        jsonData.map((e) => Todo.fromJson(e as Map<String, dynamic>)).toList();

    return todos;
  }
}
