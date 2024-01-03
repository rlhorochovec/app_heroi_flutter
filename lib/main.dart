import 'package:app_heroi_flutter/constant/constants.dart';
import 'package:app_heroi_flutter/service/hero_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_heroi_flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HeroScreen(title: 'app_heroi_flutter'),
    );
  }
}

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key, required this.title});

  final String title;

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: ApiService.getHeroes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var heroes = snapshot.data;
          return ListView.builder(
            itemCount: heroes.length,
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
    );
  }
}
