import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view/component/detail_widget.dart';

class DetailsScreen extends StatelessWidget {
  final Pokee poke;
  const DetailsScreen({required this.poke,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_new_outlined,size: 16,),color: Colors.white,
        onPressed:(){
          Navigator.pop(context);
        } ,),
        title: Text(poke.name ?? "" ,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    width: double.infinity,
            
                    //padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Text(poke.name ?? "",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        Text("Height ${poke.height ?? ""}",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                        Text("Weight ${poke.weight ?? ""}",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),),
                        Text("Types",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                            return DetailWidget(feature: poke.type![index], color: Colors.yellow);
                          }, separatorBuilder: (context, index) {
                            return SizedBox(width: 10,);
                          }, itemCount: poke.type?.length ?? 0),
                        ),
                        Text("Weakness",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return DetailWidget(feature: poke.weaknesses![index], color: Colors.red);
                              }, separatorBuilder: (context, index) {
                            return SizedBox(width: 10,);
                          }, itemCount: poke.weaknesses?.length ?? 0),
                        )
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: -70,
                    start: (MediaQuery.of(context).size.width/2) - 50 ,
                    child: Image.network(poke.image??"",height: 200,width: 100,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
