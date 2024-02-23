

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/view/screens/pokemon_screen.dart';
import 'package:pokemon_app/view_model/cubit/poke_cubit/pokemon_cubit.dart';
import 'package:pokemon_app/view_model/data/network/dio_helper.dart';

void main (){



  List<String> l1=["Ahmed","Mohamed","Farouk"];
  List<String> l2 = l1;
  print(l2);

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => PokemonCubit(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,

      home: PokemonScreen(),
    ),
  ));
}