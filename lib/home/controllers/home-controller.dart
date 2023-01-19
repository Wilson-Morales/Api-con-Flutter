import 'dart:convert';
import 'package:aplicacion/home/models/character.dart';
import 'package:aplicacion/home/repositories/home-api-repositories.dart';
import 'package:http/http.dart';

class HomeController {
  final homeApiRepository = HomeRepository();

  Future<List<CharacterDTO>> getCharacters() async {
    final Response response = await homeApiRepository.getCharacters();
    List<CharacterDTO> characters = [];

    final bool validaStatusCode = response.statusCode == 200;
    if (validaStatusCode) {
      final Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      characters = charactersResults
          .map((character) => CharacterDTO.formJason(character))
          .toList();
    }

    return characters;
  }
}

final homeController = HomeController();
