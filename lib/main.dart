// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pets/widgets/pet_card.dart';
import './helper/pets_list.dart' as pets;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffe2dfe6),
        primaryColor: const Color(0xff666769),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pets List',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 27,
              letterSpacing: 7),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Center(
        child: SizedBox(
          height: 240,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => PetCard(i),
            itemCount: pets.petsList.length,
          ),
        ),
      ),
    );
  }
}
