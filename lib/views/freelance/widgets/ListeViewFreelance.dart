import 'package:find_v2/components/FreelanceCard.dart';
import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/TextName.dart';
import 'package:find_v2/components/UserNetworkImage.dart';
import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/freelance/oneFreelance.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final double height = MediaQuery.of(context).size.height;
    final Brightness brightness = Theme.of(context).brightness;
    ;
    final double width = MediaQuery.of(context).size.width;
    final Color backgroundColorSub =
        brightness == Brightness.dark ? Colors.black : Colors.white;
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
                onTap: () => {
                  Get.to(UserProfilePage(freelance: freelance),
                      transition: Transition.fadeIn)
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  constraints: BoxConstraints(minHeight: 320, maxHeight: 350),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeDarkBackground.getBackgroundColor(context),
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
                            height: height * 0.20,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: UserNetworkImage(
                                freelance.user.profilePhotoPath),
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
                                TextComponent(
                                  text: freelance.nomComplet,
                                  size: 16.sp,
                                ),
                                TextComponent(
                                  text: 'Niveau ${freelance.level}',
                                  size: 12.sp,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextComponent(
                              text: freelance.categoryName,
                              size: 12.sp,
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              children: [
                                ...freelance.subcategories?.take(2)?.map(
                                          (e) => Container(
                                            margin: const EdgeInsets.all(2),
                                            //padding: EdgeInsets.all(value),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              // shape: BoxShape.circle,
                                              color:
                                                  backgroundColorSub, // Couleur du cercle d'expérience
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              child: TextName(
                                                name: e.name,
                                                taille: 30,
                                                size: 12.sp,
                                              ),
                                            ),
                                          ),
                                        ) ??
                                    []
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
