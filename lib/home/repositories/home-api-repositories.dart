import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeRepository {
  final String api = "https://rickandmortyapi.com/api/";

  Future<http.Response> getCharacters() async {
    Uri uri = Uri.parse('${api}character/');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json: charsert=UTF-8',
    });
  }
}
