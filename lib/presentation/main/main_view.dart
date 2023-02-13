import 'package:braeking_bad/business_logic/cubit/character_cubit.dart';
import 'package:braeking_bad/constants/color_manager.dart';
import 'package:braeking_bad/data/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/characteritem.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late List<dynamic> allCharacters;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.myYellow,
        title: const Text('Breaking Bad'),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: ((context, state) {
        if (state is CharatersLaoded) {
          allCharacters = state.characters;
          return buildLaodedListWidgets();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManger.myYellow,
            ),
          );
        }
      }),
    );
  }

  Widget buildLaodedListWidgets() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: ColorManger.myGrey,
        child: Column(children: [
          buildCharactersList(),
        ]),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      itemCount: allCharacters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: ((context, index) {
        Character ch = allCharacters[index];
        return CharacterItem(character: ch);
      }),
    );
  }
}
