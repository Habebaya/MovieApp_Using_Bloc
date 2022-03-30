
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usingbloc/business_logic/cubit/characters_cubit.dart';
import 'package:usingbloc/constans/my_colors.dart';
import 'package:usingbloc/data/models/character.dart';
import 'package:usingbloc/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
 late List<Character> allCharacter;


  @override
  void initState() {
    super.initState();
  allCharacter= BlocProvider.of<CharactersCubit>(context).getAllCharacters();

  }
  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit, CharactersState>(builder: (context,state)
    {
      if(state is CharacterLoaded){
        allCharacter = (state).characters;
        return buildLoadedWidget();
      }else{
       return showLoadingIndicator();

      }
    },
    );
  }

  Widget showLoadingIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: MyColor.yellow,
      ),
    );
  }
  Widget buildLoadedWidget(){
    return SingleChildScrollView(
      child: Container(
        color:  MyColor.gary,
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
  }
  Widget buildCharactersList(){
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 0.5),
     shrinkWrap:  true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacter.length,
        itemBuilder: (ctx,index){
      return CharacterItem(character: allCharacter[index],);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.yellow,
        title: const Text("Characters",style: TextStyle(color: MyColor.gary),),
      ),
      body: buildBlocWidget(),
    );
  }
}
