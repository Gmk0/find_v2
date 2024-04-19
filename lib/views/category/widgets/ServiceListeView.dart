import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/OneService.dart';
import 'package:find_v2/views/service/OneServiceView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceListView extends StatelessWidget {
  const ServiceListView({
    required this.service,
    required this.animationController,
    required this.animation,
    required this.callback,
    super.key,
  });

  final VoidCallback callback;
  final ServiceModel service;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.grey[900]! : Colors.white;
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
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
              child: GestureDetector(
                onTap: () =>
                    {Get.to(oneServiceView(), transition: Transition.fadeIn)},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        //color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(2, 2),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: IntrinsicHeight(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Stack(alignment: Alignment.topLeft, children: [
                          Container(
                            //margin: EdgeInsets.all(5),
                            height: 150.h,
                            width: 120.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: PNetworkImage(
                              service.media != null && service.media!.isNotEmpty
                                  ? service.media![0].url
                                  : images[0],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ]),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16.sp,
                                        ),
                                        ReusableText(
                                          text: "(4)",
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                      ],
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    child: Text(
                                      service.title,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Get.to(OneService(service: service),
                                              transition: Transition.fadeIn);
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text('a partir de '),
                                            const SizedBox(width: 5),
                                            Text(
                                              service.basicPrice,
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: skinFill,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      // Ajouter d'autres détails du service si nécessaire
                    )),
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
