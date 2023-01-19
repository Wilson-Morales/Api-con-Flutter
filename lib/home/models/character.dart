import 'package:aplicacion/home/models/character.dart';

class CharacterDTO {
  int id;
  String name;
  String image;
  String status;
  String species;

  CharacterDTO.formJason(Map<dynamic, dynamic> jason)
      : id = jason['id'],
        name = jason['name'],
        image = jason['image'],
        status = jason['status'],
        species = jason['species'];
}
