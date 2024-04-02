import 'package:find_v2/components/FreelanceCard.dart';
import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/utils/theme2.dart';
import 'package:find_v2/views/freelance/oneFreelance.dart';
import 'package:find_v2/views/service/OneService.dart';
import 'package:find_v2/views/service/OneService2.dart';
import 'package:find_v2/views/service/OneServiceView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FreelanceListView extends StatelessWidget {
  const FreelanceListView({
    required this.freelance,
    required this.animationController,
    required this.animation,
    required this.callback,
    super.key,
  });

  final VoidCallback callback;
  final FreelanceModel freelance;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Container(
              // constraints: BoxConstraints(minHeight: 280, maxHeight: 300),
              //width: 200,
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () =>
                    {Get.to(UserProfilePage(), transition: Transition.fadeIn)},
                child: Container(
                  margin: EdgeInsets.all(20),
                  constraints: BoxConstraints(minHeight: 320, maxHeight: 350),
                  padding: EdgeInsets.all(5),
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
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 160.0,
                            width: 240.0,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: const AssetImage(
                                'assets/images/ff3.png',
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
                        padding:
                            const EdgeInsets.only(left: 10, top: 10, right: 10),
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
                                      fontSize: 16,
                                      color: Colors.grey.shade800),
                                ),
                                Text(
                                  'Niveau ${freelance.level}',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey.shade800),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Programmation & Tech',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey.shade800),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Container(
                                    margin: const EdgeInsets.all(2),

                                    //padding: EdgeInsets.all(value),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
