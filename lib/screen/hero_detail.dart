import 'package:app_heroi_flutter/constant/constants.dart';
import 'package:app_heroi_flutter/model/hero_model.dart';
import 'package:flutter/material.dart';

class HeroDetail extends StatelessWidget {
  const HeroDetail({super.key, required this.hero});

  final HeroModel hero;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(hero.name.toString()),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: theme.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageProfile(imageUrl: IMG_URL + hero.image.toString()),
                    const SizedBox(
                      height: 32,
                      width: double.infinity,
                    ),
                    Text(
                      hero.name.toString(),
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Nome civil'),
                    subtitle: Text(hero.civil.toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.label),
                    title: const Text('Universo'),
                    subtitle: Text(hero.universe.toString()),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  final String imageUrl;
  const ImageProfile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4),
      child: CircleAvatar(
        radius: 100.0,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: Colors.white,
      ),
    );
  }
}
