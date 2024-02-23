import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view/screens/details_screen.dart';

class PokeWidget extends StatelessWidget {
  final Pokee poke;
  const PokeWidget({required this.poke,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsScreen(poke: poke);
        },));
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
          color: Colors.white,
          // image:DecorationImage(
          //   image:  NetworkImage(poke.image!,scale:1.0),
          // )
        ),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(poke.image!,width: 100,height: 100,errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error_outline_rounded);
            },),
      
            Text(poke.name!,style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),

      
          ],
        ),
      ),
    );
  }
}
