import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/screens/detail.dart';
import 'package:pokedex_flutter/widgets/custom_appbar.dart';
import 'package:pokedex_flutter/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var customJsonDecoder = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(customJsonDecoder);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: customAppBar('MiPokedex', null),
      body: pokeHub == null ? Loading(size: 100) : buildPokedoxScreen(context),
    );
  }

  buildPokedoxScreen(context) {
    return GridView.count(
      crossAxisCount: 2,
      children: pokeHub.pokemon
          .map(
            (poke) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: InkWell(
                splashColor: Colors.red,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      poke: poke,
                    ),
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  child: Container(
                    height: 230,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          poke.img == null
                              ? Loading(
                                  size: 30,
                                )
                              : Hero(
                                  tag: poke.img,
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(poke.img),
                                      ),
                                    ),
                                  ),
                                ),
                          Text(
                            poke.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
