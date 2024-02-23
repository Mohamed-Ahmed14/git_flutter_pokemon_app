import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/view_model/cubit/poke_cubit/pokemon_cubit.dart';

import '../../view_model/cubit/poke_cubit/pokemon_state.dart';
import '../component/pokemon_widget.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});


  @override
  Widget build(BuildContext context) {
    PokemonCubit.get(context).getPokemons();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              title: Text("Poke App", style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
              backgroundColor: Colors.blue,
              centerTitle: true,
            ),
            body: BlocBuilder<PokemonCubit, PokemonState>(
                builder: (context, state) {
                  var cubit = PokemonCubit.get(context);
                  return Visibility(
                    visible: state is GetPokemonsSuccessState,
                    replacement: Center(child: CircularProgressIndicator(),),
                    child: GridView.count(crossAxisCount: 2,
                      padding: EdgeInsets.all(12),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                       children: List.generate(cubit.poke?.pokemon?.length??0, (index) =>PokeWidget(poke: cubit.poke!.pokemon![index],),
                  )
                    )
                  );
                }
            )


        )
    );
  }

}

