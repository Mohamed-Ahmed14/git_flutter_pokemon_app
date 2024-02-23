

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view_model/cubit/poke_cubit/pokemon_state.dart';
import 'package:pokemon_app/view_model/data/network/dio_helper.dart';
import 'package:pokemon_app/view_model/data/network/end_points.dart';

class PokemonCubit extends Cubit<PokemonState>{
  PokemonCubit():super(PokemonInitState());

  static PokemonCubit get(context)=>BlocProvider.of<PokemonCubit>(context);



  Pokemons? poke;

  Future<void> getPokemons() async{
    emit(GetPokemonsLoadingState());
       await DioHelper.get(url: EndPoints.baseUrl).then((value) {
         var data = jsonDecode(value.data);
         //print((value.data["pokemon"]).toList);
         poke=Pokemons.fromJson(data);
         //print(poke?.pokemon?[0].name);

         emit(GetPokemonsSuccessState());
       }).catchError((error){
         print(error.response.data);
         emit(GetPokemonsErrorState());
       });


  }
}