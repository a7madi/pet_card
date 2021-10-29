import 'package:flutter/material.dart';
import '../helper/pets_list.dart' as pets;

class PetCard extends StatelessWidget {
  final int petID;
  const PetCard(this.petID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String petName = pets.petsList[petID].name;
    String age = _age(pets.petsList[petID].dob);
    String imgUrl = pets.petsList[petID].imgUrl;
    const height = 240.0;
    const width = 200.0;

    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),

      // Card Decoration:
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0xFFc6c6c6), offset: Offset(1, 3), blurRadius: 9),
        ],
      ),

      // Card Content:
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          // pet image:
          Image.asset(
            imgUrl,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 5,
          ),

          // pet name:
          Text(
            petName,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xFF303132)),
          ),

          // pet age:
          Text(
            age,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Colors.grey,
                letterSpacing: 1),
          )
        ],
      ),
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
