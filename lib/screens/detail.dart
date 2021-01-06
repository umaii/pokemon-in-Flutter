import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/widgets/custom_appbar.dart';
import 'package:pokedex_flutter/widgets/seccond_stats_card.dart';

import '../widgets/stats_card.dart';

class Details extends StatelessWidget {
  Pokemon poke;
  Details({
    this.poke,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: customAppBar(
        '${poke.name}',
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildUpCard(),
            buildStatsCard(),
            SizedBox(height: 20),
            buildWeaknesses(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Column buildWeaknesses() {
    return Column(
      children: [
        Text(
          'Weaknesses:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: poke.weaknesses
              .map(
                (t) => FilterChip(
                  selected: false,
                  avatarBorder: Border.all(color: Colors.red),
                  backgroundColor: Colors.grey[850],
                  selectedShadowColor: Colors.red,
                  shadowColor: Colors.red,
                  selectedColor: Colors.red,
                  label: Text(
                    t,
                    style: TextStyle(color: Colors.white),
                  ),
                  onSelected: (b) {},
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Container buildStatsCard() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Stats:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 5),
          StatsCard(
            height: '${poke.height}',
            weight: '${poke.weight}',
            avgSpawns: '${poke.avgSpawns}',
            egg: '${poke.egg}',
          ),
          SizedBox(height: 10),
          SeccondStatsCard(
            candy: '${poke.candy}',
            candyCount: '${poke.candyCount}',
          ),
        ],
      ),
    );
  }

  Padding buildUpCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: poke.img, child: Image.network(poke.img)),
          SizedBox(width: 15),
          Column(
            children: [
              buildIDText(),
              SizedBox(height: 10),
              buildTYPEText(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTYPEText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: poke.type
          .map(
            (t) => FilterChip(
              selected: false,
              avatarBorder: Border.all(color: Colors.red),
              backgroundColor: Colors.grey[850],
              label: Text(
                t,
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (b) {},
            ),
          )
          .toList(),
    );
  }

  RichText buildIDText() {
    return RichText(
      text: TextSpan(
        text: 'Pokedex ID: ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: ' #${poke.id}',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
