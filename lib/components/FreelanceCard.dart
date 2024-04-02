import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/views/freelance/oneFreelance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreelanceCard extends StatelessWidget {
  FreelanceCard(this.freelance, {super.key});

  final FreelanceModel freelance;
  // final double height

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(UserProfilePage(), transition: Transition.fadeIn);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 220,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 4.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 140.0,
                  width: 240.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/ff3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        freelance.nomComplet,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade800),
                      ),
                      Text(
                        'Niveau ${freelance.level}',
                        style: TextStyle(
                            fontSize: 12.0, color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Programmation & Tech',
                    style:
                        TextStyle(fontSize: 12.0, color: Colors.grey.shade800),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          margin: const EdgeInsets.all(2),

                          //padding: EdgeInsets.all(value),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            // shape: BoxShape.circle,
                            color: Colors.grey
                                .shade200, // Couleur du cercle d'expérience
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: const Text(
                              'Development web',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
