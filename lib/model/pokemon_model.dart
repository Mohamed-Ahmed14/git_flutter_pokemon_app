
class Pokemons{
    List<Pokee>? pokemon=[];
    Pokemons({this.pokemon});
    Pokemons.fromJson(Map<String,dynamic> json)
    {
      if(json["pokemon"] != null)
        {
          for(var i in json["pokemon"])
            {
              pokemon?.add(Pokee.fromJson(i));
            }
        }

    }
}

class Pokee{
  int? id;
  String? num;
  String? name;
  String? image;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candy_count;
  String? egg;
  double? spawn_chance;  //not yet
  double? avg_spawns;    //not yet
  String? spawn_time;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<Map<String,dynamic>>? next_evolution; //not yet

  Pokee({
      this.id,
      this.num,
      this.name,
      this.image,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candy_count,
      this.egg,
      this.spawn_chance,
      //  this.avg_spawns,
      this.spawn_time,
      this.multipliers,
      this.weaknesses,
      // this.next_evolution
  });
  Pokee.fromJson(Map<String,dynamic> json){
    print("NOoo");
    id=json["id"];
    num=json["num"];
    name=json["name"];
    image=json["img"];
    type=json["type"].cast<String>();
    height=json["height"];
    weight=json["weight"];
    candy=json["candy"];
    candy_count=json["candy_count"];
    egg=json["egg"];
    //spawn_chance=json["spawn_chance"]?.cast<double>();
    // avg_spawns=json["avg_spawns"];
    spawn_time=json["spawn_time"];
    multipliers=json["multipliers"]?.cast<double>();
    weaknesses=json["weaknesses"].cast<String>();
    // //next_evolution=json["next_evolution"];

  }
}