import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  const PetCard(
      {Key? key,
      required this.petName,
      required this.petAge,
      required this.imgUrl})
      : super(key: key);

  final String petName;
  final DateTime petAge;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    String age = _age(petAge);
    const height = 240.0;
    const width = 200.0;

    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),

      // Card Decoration:
      decoration: _cardDecoration(),

      // Card Content:
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _imageSection(),
          const SizedBox(
            height: 5,
          ),
          _nameSection(),
          _ageSection(age)
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      boxShadow: [
        BoxShadow(
            color: Color(0xFFc6c6c6), offset: Offset(1, 3), blurRadius: 9),
      ],
    );
  }

  Image _imageSection() {
    return Image.asset(
      imgUrl,
      width: 150,
      height: 150,
      fit: BoxFit.contain,
    );
  }

  Text _nameSection() {
    return Text(
      petName,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF303132)),
    );
  }

  Text _ageSection(String age) {
    return Text(
      age,
      style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 10,
          color: Colors.grey,
          letterSpacing: 1),
    );
  }

  String _age(DateTime dob) {
    var duration = DateTime.now().difference(dob).inDays;
    var age = duration ~/ 365;

    if (age > 1) {
      return '$age years old';
    }
    return '$age year old';
  }
}
