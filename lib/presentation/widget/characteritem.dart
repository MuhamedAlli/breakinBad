import 'package:braeking_bad/constants/color_manager.dart';
import 'package:braeking_bad/data/models/character_model.dart';
import 'package:braeking_bad/presentation/routes_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: ColorManger.myWhite,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.detailsRoute,
              arguments: character);
        },
        child: GridTile(
          footer: Hero(
            tag: character.charId as Object,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name.toString(),
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 18,
                  color: ColorManger.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: ColorManger.myGrey,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: character.image!,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
            /*child: widget.character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    imageScale: 1.0,
                    placeholderScale: 1.0,
                    fit: BoxFit.cover,
                    placeholder: "assets/heisenberg.png",
                    image: widget.character.image.toString(),
                  )
                : const CircularProgressIndicator(),*/
          ),
        ),
      ),
    );
  }
}
