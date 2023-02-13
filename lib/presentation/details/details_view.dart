import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:braeking_bad/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/character_cubit.dart';
import '../../data/models/character_model.dart';

class DetailsView extends StatelessWidget {
  final Character character;
  const DetailsView({
    Key? key,
    required this.character,
  }) : super(key: key);
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      stretch: true,
      pinned: true,
      backgroundColor: ColorManger.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname.toString(),
          style: const TextStyle(color: ColorManger.myWhite),
        ),
        background: Hero(
          //May be Error here >> i will chek this later!!!
          tag: character.charId as Object,
          child: Image.network(character.image.toString(), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: ColorManger.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: ColorManger.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endindent) {
    return Divider(
      height: 30,
      endIndent: endindent,
      color: ColorManger.myYellow,
      thickness: 2,
    );
  }

  Widget checkIfQuotesAreLaoded(state) {
    if (state is QuotesLaoded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var qoute = (state).quotes;
    if (qoute.length != 0) {
      int randonQuoteIndex = Random().nextInt(qoute.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: ColorManger.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: ColorManger.myYellow,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [FlickerAnimatedText(qoute[randonQuoteIndex].quote)],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context)
        .getQuotes(character.name.toString());
    return Scaffold(
      backgroundColor: ColorManger.myGrey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('job : ', character.jobs!.join(' / ')),
                    buildDivider(340),
                    characterInfo(
                        'Appeared in : ', character.categoryForTowSeries!),
                    buildDivider(270),
                    character.appearanceOfSeasons!.isEmpty
                        ? Container()
                        : characterInfo('Seasons : ',
                            character.appearanceOfSeasons!.join(' / ')),
                    character.appearanceOfSeasons!.isNotEmpty
                        ? buildDivider(300)
                        : Container(),
                    characterInfo('Status : ', character.statusIfDeadOrAlive!),
                    buildDivider(305),
                    character.betterCallSaulAppearance!.isEmpty
                        ? Container()
                        : characterInfo('Better Call Saul Season : ',
                            character.betterCallSaulAppearance!.join(' / ')),
                    character.betterCallSaulAppearance!.isNotEmpty
                        ? buildDivider(250)
                        : Container(),
                    characterInfo('Actor/Actress : ', character.actorName!),
                    buildDivider(250),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<CharacterCubit, CharacterState>(
                        builder: ((context, state) {
                      return checkIfQuotesAreLaoded(state);
                    })),
                  ],
                ),
              ),
              const SizedBox(
                height: 600,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
