import 'package:app_heroi_flutter/constant/constants.dart';
import 'package:app_heroi_flutter/service/hero_service.dart';
import 'package:flutter/material.dart';

class HeroList extends StatefulWidget {
  const HeroList({super.key, required this.title});

  final String title;

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var heroes = snapshot.data;
          return ListView.builder(
            itemCount: heroes == null ? 0 : heroes.length,
            itemBuilder: (context, index) {
              var hero = heroes[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(IMG_URL + hero.image),
                ),
                title: Text(hero.name),
                subtitle: Text(hero.civil),
                trailing: const Icon(Icons.more_vert),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: ApiService.getHeroes(),
    );
  }
}
