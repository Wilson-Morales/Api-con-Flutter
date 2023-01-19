import 'package:aplicacion/home/models/character.dart';
import 'package:flutter/widgets.dart';

class CharacterCard extends StatelessWidget {
  final CharacterDTO characterDTO;
  const CharacterCard({Key? key, required this.characterDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 30),
      child: Row(
        children: [
          Image.network(
            characterDTO.image,
            width: 100,
            //height: 50,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(characterDTO.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text(characterDTO.species, style: TextStyle(fontSize: 25)),
                  Text(characterDTO.status, style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
