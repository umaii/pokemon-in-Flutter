import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  String id;
  String image;
  String type;
  double imgaeSize;

  PokemonCard({
    this.id,
    this.image,
    this.type,
    this.imgaeSize,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            image,
            height: imgaeSize,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Pokédex ID:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    id,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Type:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    type,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
