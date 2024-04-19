import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/TextName.dart';
import 'package:find_v2/components/UserNetworkImage.dart';
import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/views/freelance/oneFreelance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FreelanceCard extends StatelessWidget {
  FreelanceCard(this.freelance, {super.key});

  final FreelanceModel freelance;
  // final double height

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.grey[900]! : Colors.white;
    final Color backgroundColorSub =
        brightness == Brightness.dark ? Colors.black : Colors.white;

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(UserProfilePage(freelance: freelance),
            transition: Transition.fadeIn);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        width: 250.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
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
                  height: 140.h,
                  width: 250.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: UserNetworkImage(freelance.user.profilePhotoPath),
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
                      TextName(
                        name: freelance.nomComplet,
                        size: 14,
                        taille: 15,
                      ),
                      TextComponent(
                        text: 'Nv ${freelance.level}',
                        size: 12.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextComponent(
                    text: freelance.categoryName,
                    size: 12,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    children: [
                      ...freelance.subcategories?.take(2)?.map(
                                (e) => Container(
                                  margin: const EdgeInsets.all(2),
                                  //padding: EdgeInsets.all(value),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    // shape: BoxShape.circle,
                                    color:
                                        backgroundColorSub, // Couleur du cercle d'expérience
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: TextName(
                                      name: e.name,
                                      taille: 22,
                                      size: 12,
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
    );
  }
}
