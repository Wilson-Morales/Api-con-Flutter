import 'package:aplicacion/home/controllers/home-controller.dart';
import 'package:aplicacion/home/models/character.dart';
import 'package:aplicacion/home/screens/widgets/character-card.dart';
import 'package:aplicacion/utils/widgets/drawers.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividad: API Rick and Morty"),
      ),
      drawer: Drawer(child: MyDrawer()),
      body: SingleChildScrollView(
        child: Column(
          children: [getCharacters()],
        ),
      ),
    );
  }

  FutureBuilder<List<CharacterDTO>> getCharacters() =>
      FutureBuilder<List<CharacterDTO>>(
          future: homeController.getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<CharacterDTO> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;
            if (characterCounter) {
              return _buildMyCharacter(characters);
            } else {
              return Container();
            }
          });

  Widget _buildMyCharacter(List<CharacterDTO> characters) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(characterDTO: characters[index]);
        });
  }
}
